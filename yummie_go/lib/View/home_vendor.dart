import 'package:flutter/material.dart';
import 'package:yammiego/Model/vendor_order.dart';

class VendorHomePage extends StatefulWidget {
  const VendorHomePage({super.key});

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  late List<VendorOrder> orders;

  @override
  void initState() {
    super.initState();
    orders = [
      VendorOrder(
        orderId: 201,
        customerName: "Amit",
        amount: 450,
        status: "Pending",
        date: DateTime.now(),
      ),
      VendorOrder(
        orderId: 202,
        customerName: "Neha",
        amount: 300,
        status: "Delivered",
        date: DateTime.now(),
      ),
    ];
  }

  /// 🟢 ACTIONS
  void acceptOrder(VendorOrder order) {
    setState(() {
      order.status = "Processing";
    });
  }

  void markReady(VendorOrder order) {
    setState(() {
      order.status = "Ready for Delivery";
    });
  }

  void declineOrder(VendorOrder order) {
    setState(() {
      order.status = "Declined";
    });
  }

  Color statusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Processing":
        return Colors.orange;
      case "Ready for Delivery":
        return Colors.blue;
      case "Declined":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          /// HEADER
          Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, top: 60),
            color: Colors.green,
            child: const Text(
              "Vendor Dashboard",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// ORDERS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.customerName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Text("₹ ${order.amount}"),

                        const SizedBox(height: 8),

                        /// STATUS BUTTONS
                        if (order.status == "Pending")
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => acceptOrder(order),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text("Accept"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () => declineOrder(order),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text("Decline"),
                              ),
                            ],
                          ),

                        if (order.status == "Processing")
                          ElevatedButton(
                            onPressed: () => markReady(order),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            child: const Text("Mark Ready"),
                          ),

                        const SizedBox(height: 8),

                        /// STATUS LABEL
                        Text(
                          order.status,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: statusColor(order.status),
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
    );
  }
}
