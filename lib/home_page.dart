import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> favourites = List.generate(6, (_) => false);
  List<bool> cartSelected = List.generate(6, (_) => false);

  final List<Map<String, dynamic>> products = [
    {
      "name": "Wireless Headphones",
      "price": 50,
      "image":
          "https://images.unsplash.com/photo-1619296794093-3df1ae6819a8?w=500"
    },
    {
      "name": "Smartphone",
      "price": 499,
      "image":
          "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500"
    },
    {
      "name": "Laptop",
      "price": 899,
      "image":
          "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500"
    },
    {
      "name": "Potted Plant",
      "price": 20,
      "image":
          "https://images.unsplash.com/photo-1463320898484-cdee8141c787?w=500"
    },
    {
      "name": "White Chair",
      "price": 120,
      "image":
          "https://plus.unsplash.com/premium_photo-1678074057896-eee996d4a23e?w=500"
    },
    {
      "name": "Bluetooth Speaker",
      "price": 80,
      "image":
          "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500"
    },
  ];

  final List<Map<String, String>> offers = [
    {
      "title": "You are a university student? : Get 20% off now!",
      "image":
          "https://images.unsplash.com/photo-1607083206968-13611e3d76db?w=300"
    },
    {
      "title": "Special Offer for Potted Plant: Buy 1 Get 1 Free!",
      "image":
          "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=300"
    },
    {
      "title": "10% on electronics: Limited Time Deal!",
      "image":
          "https://plus.unsplash.com/premium_photo-1679079456083-9f288e224e96?w=300"
    },
    {
      "title": "Special Offer: Free Shipping Today!",
      "image":
          "https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNoaXBwaW5nfGVufDB8fDB8fHww"
    },
    {
      "title": "Company Owners: Sale up to 50% off!",
      "image": "https://images.unsplash.com/photo-1556740749-887f6717d7e4?w=300"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5CF6),
        centerTitle: true,
        title: const Text(
          "Our Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top banner
            SizedBox(
              height: 220,
              child: PageView(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1521334884684-d80222895322?w=500",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503602642458-232111445657?w=500",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: AspectRatio(
                              aspectRatio: 1.3,
                              child: CachedNetworkImage(
                                imageUrl: product["image"],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  product["name"],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  "\$${product["price"]}.00",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              key: ValueKey<bool>(cartSelected[index]),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      cartSelected[index]
                                          ? "Item removed from cart"
                                          : "Item added to cart",
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                                setState(() {
                                  cartSelected[index] = !cartSelected[index];
                                });
                              },
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: cartSelected[index]
                                    ? const Color(0xFF8B5CF6)
                                    : Colors.black,
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                              child: IconButton(
                                key: ValueKey<bool>(favourites[index]),
                                onPressed: () {
                                  setState(() {
                                    favourites[index] = !favourites[index];
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: Text(
                                        favourites[index]
                                            ? "Added to Favourites"
                                            : "Removed from Favourites",
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  favourites[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: favourites[index]
                                      ? const Color(0xFF8B5CF6)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hot Offers 🔥",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  color: Colors.grey,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl: offer["image"]!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          offer["title"]!,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
