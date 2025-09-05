import 'package:flutter/material.dart';
import 'package:shopping_app/signin_page.dart';
import 'package:shopping_app/signup_page.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09090B),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Shopify",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Color(0xFF8B5CF6),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/shopping1.jpeg',
                width: 150, height: 150, fit: BoxFit.cover),
            const SizedBox(
              width: 20,
            ),
            Image.network(
                'https://img.freepik.com/free-photo/shopping-cart-full-products-inside-supermarket_123827-28166.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover),
          ]),
          SizedBox(
            height: 60,
          ),
          Text(
            "“Shop the Future”",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Discover the latest trends, exclusive deals, and products hand-picked for you.",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SigninPage()));
            },
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 30, color: Color(0xFF8B5CF6)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: BorderSide(color: Color(0xFF8B5CF6), width: 2),
              minimumSize: Size(250, 60),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupPage()));
            },
            child: Text("Sign up",
                style: TextStyle(fontSize: 30, color: Colors.white)),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5CF6), minimumSize: Size(250, 60)),
          )
        ],
      ),
    );
  }
}
