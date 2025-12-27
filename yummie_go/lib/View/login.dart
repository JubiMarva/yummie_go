import 'package:flutter/material.dart';
import 'package:yammiego/View/home_customer.dart';
import 'package:yammiego/View/home_delivery.dart';
import 'package:yammiego/View/register.dart';
import 'package:yammiego/View/home_vendor.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Customer';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          // 🔹GREEN HEADER
          Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, top: 60),
            color: Colors.green,
            child: const Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 🔹LOGIN CARD
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Login to continue using Yummie Go",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 25),

                      // 🔽 ROLE DROPDOWN
                      DropdownButtonFormField<String>(
                        value: selectedRole,
                        decoration: _inputDecoration("Login as"),
                        items: const [
                          DropdownMenuItem(
                              value: 'Customer', child: Text('Customer')),
                          DropdownMenuItem(
                              value: 'Vendor',
                              child: Text('Vendor')),
                          DropdownMenuItem(
                              value: 'Delivery Boy',
                              child: Text('Delivery Boy')),
                        ],
                        onChanged: (value) {
                          setState(() => selectedRole = value!);
                        },
                      ),

                      const SizedBox(height: 16),

                      // EMAIL
                      TextField(
                        decoration: _inputDecoration("Email")
                            .copyWith(prefixIcon: const Icon(Icons.email)),
                      ),

                      const SizedBox(height: 16),

                      // PASSWORD
                      TextField(
                        obscureText: hidePassword,
                        decoration: _inputDecoration("Password").copyWith(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            navigateByRole(context);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Center(child: Text("or")),
                      const SizedBox(height: 20),

                      // REGISTER
                      if (selectedRole == 'Customer' ||
                          selectedRole == 'Vendor' || 
                          selectedRole =="Delivery Boy")
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New here? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Create an account",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 COMMON INPUT DECORATION
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  // 🔀 ROLE-BASED NAVIGATION (UNCHANGED)
  void navigateByRole(BuildContext context) {
    Widget nextScreen;

    switch (selectedRole) {
      case 'Vendor':
        nextScreen = const VendorHomePage();
        break;
      case 'Delivery Boy':
        nextScreen = const DeliveryHomePage();
        break;
      default:
        nextScreen = const CustomerHomePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }
}
