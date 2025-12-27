import 'package:flutter/material.dart';
import 'package:yammiego/Model/order.dart';
import 'package:yammiego/View/pickup_details.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Order> assignedOrders = [
      Order(
        orderId: 101,
        customerName: "Rahul",
        restaurantName: "Pizza Hut",
        pickupAddress: "Pizza Hut, MG Road",
        dropAddress: "Indiranagar, Bangalore",
        amount: 350,
        status: "Assigned",
      ),
      Order(
        orderId: 102,
        customerName: "Anjali",
        restaurantName: "Burger King",
        pickupAddress: "Burger King, Forum Mall",
        dropAddress: "BTM Layout, Bangalore",
        amount: 220,
        status: "Assigned",
      ),
    ];

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
                  "Assigned Orders",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: () {
                    // refresh orders (future use)
                  },
                ),
              ],
            ),
          ),

          /// ✅ Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: assignedOrders.length,
              itemBuilder: (context, index) {
                final order = assignedOrders[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: Text(
                        order.orderId.toString(),
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                    title: Text(
                      order.restaurantName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Customer: ${order.customerName}"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ ${order.amount}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.status,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PickupDetailsPage(order: order),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
