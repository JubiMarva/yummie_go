import 'package:flutter/material.dart';
import 'package:yammiego/View/home_customer.dart';
import 'package:yammiego/View/home_delivery.dart';
import 'package:yammiego/View/home_vendor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedRole = "Customer";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final roles = ["Customer", "Vendor", "Delivery Boy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          /// Green Header
          Container(
            height: 180,
            width: double.infinity,
            color: const Color(0xFF4CAF50),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// Card
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Register to continue using Yummie Go",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 25),

                    /// Role Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items: roles
                          .map((role) => DropdownMenuItem(
                                value: role,
                                child: Text(role),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedRole = value!);
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        filled: true,
                        fillColor: const Color(0xFFF7F7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Name
                    TextField(
                      controller: nameController,
                      decoration: _inputDecoration(
                        "Full Name",
                        Icons.person,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Email
                    TextField(
                      controller: emailController,
                      decoration: _inputDecoration(
                        "Email",
                        Icons.email_outlined,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Password
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: _inputDecoration(
                        "Password",
                        Icons.lock_outline,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Register Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          Widget destination;

                          if (selectedRole == "Customer") {
                            destination = const CustomerHomePage();
                          } else if (selectedRole == "Vendor") {
                            destination = const VendorHomePage();
                          } else {
                            destination = const DeliveryHomePage();
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => destination),
                            (route) => false,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Registered as $selectedRole successfully"),
                            ),
                          );
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 16,
                          color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Login Redirect
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Already have an account? Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: const Color(0xFFF7F7F7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}


