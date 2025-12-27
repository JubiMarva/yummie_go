import 'package:flutter/material.dart';
import 'package:yammiego/View/home_customer.dart';
import 'package:yammiego/View/home_delivery.dart';
import 'package:yammiego/View/home_vendor.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          /// ✅ Green Header
          Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, top: 60, right: 16),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Admin Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.admin_panel_settings,
                      color: Colors.white),
                  onPressed: () {
                    // future settings
                  },
                ),
              ],
            ),
          ),

          /// ✅ Admin Cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _adminCard(
                    context,
                    title: "Customer Module",
                    icon: Icons.person,
                    color: Colors.blue,
                    page: const CustomerHomePage(),
                  ),
                  _adminCard(
                    context,
                    title: "Vendor Module",
                    icon: Icons.store,
                    color: Colors.orange,
                    page: const VendorHomePage(),
                  ),
                  _adminCard(
                    context,
                    title: "Delivery Module",
                    icon: Icons.delivery_dining,
                    color: Colors.green,
                    page: const DeliveryHomePage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _adminCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
