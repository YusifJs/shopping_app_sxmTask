import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';
import 'package:shopping_app/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool confirmHiddenPassword = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8B5CF6),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: screenWidth < 500 ? screenWidth : 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Please fill in your details below to create an account.",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Full Name
                          TextFormField(
                            controller: _nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Full Name",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B5CF6))),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              if (value[0] != value[0].toUpperCase()) {
                                return "First letter must be uppercase";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "example@mail.com",
                              hintStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B5CF6))),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your email";
                              }
                              if (!value.contains("@")) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white),
                            obscureText: hiddenPassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B5CF6))),
                              suffixIcon: IconButton(
                                onPressed: togglePassword,
                                icon: Icon(
                                  hiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: hiddenPassword
                                      ? Colors.white
                                      : const Color(0xFF8B5CF6),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter a password";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Confirm Password
                          TextFormField(
                            controller: _confirmPasswordController,
                            style: const TextStyle(color: Colors.white),
                            obscureText: confirmHiddenPassword,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B5CF6))),
                              suffixIcon: IconButton(
                                onPressed: toggleConfirmPassword,
                                icon: Icon(
                                  confirmHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: confirmHiddenPassword
                                      ? Colors.white
                                      : const Color(0xFF8B5CF6),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom Section: Button + "Already have account?"
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(
                                color: Color(0xFF8B5CF6), width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Success"),
                                  content: const Text(
                                      "Account created successfully"),
                                  actions: [
                                    TextButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(
                                            color: Color(0xFF8B5CF6), width: 2),
                                        minimumSize: const Size(250, 60),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            PageRouteBuilder(
                                              transitionDuration:
                                                  Duration(milliseconds: 600),
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  HomePage(),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: child,
                                                );
                                              },
                                            ));
                                      },
                                      child: const Text("Continue"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFF8B5CF6),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white70),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SigninPage()),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Color(0xFF8B5CF6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  togglePassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  toggleConfirmPassword() {
    setState(() {
      confirmHiddenPassword = !confirmHiddenPassword;
    });
  }
}
