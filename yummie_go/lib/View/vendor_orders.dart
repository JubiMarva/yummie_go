import 'package:flutter/material.dart';

class VendorOrdersPage extends StatelessWidget {
  const VendorOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🔹 SIMPLE LOCAL DATA
    List<Map<String, dynamic>> orders = [
      {
        "orderId": 201,
        "customerName": "Amit",
        "amount": 450.0,
        "status": "Delivered",
      },
      {
        "orderId": 202,
        "customerName": "Neha",
        "amount": 300.0,
        "status": "Pending",
      },
      {
        "orderId": 203,
        "customerName": "Rohit",
        "amount": 200.0,
        "status": "Delivered",
      },
    ];

    /// 🔹 REVENUE CALCULATION
    double totalRevenue = orders
        .where((o) => o["status"] == "Delivered")
        .fold(0.0, (sum, o) => sum + o["amount"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders & Revenue"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🟢 TOTAL REVENUE
            Text(
              "Total Revenue: ₹ $totalRevenue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "All Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            /// 🟢 ORDERS LIST
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        "Order #${order["orderId"]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(order["customerName"]),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("₹ ${order["amount"]}"),
                          const SizedBox(height: 4),
                          Text(
                            order["status"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: order["status"] == "Delivered"
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
