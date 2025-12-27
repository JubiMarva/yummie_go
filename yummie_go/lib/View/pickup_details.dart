import 'package:flutter/material.dart';

class PickupDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const PickupDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickup Details"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Restaurant: ${order["restaurantName"]}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Pickup: ${order["pickupAddress"]}"),
            const SizedBox(height: 8),
            Text("Drop: ${order["dropAddress"]}"),
            const SizedBox(height: 8),
            Text("Amount: ₹ ${order["amount"]}"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
