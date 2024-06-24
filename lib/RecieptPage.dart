import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiptPage extends StatelessWidget {
  final String userId; // Assuming you have a userId to fetch the receipt data
  final String receiptId; // Assuming you have a receiptId to identify the receipt

  ReceiptPage({required this.userId, required this.receiptId});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('receipts')
            .doc(receiptId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No data found'));
          }

          Map<String, dynamic>? receiptData = snapshot.data!.data() as Map<String, dynamic>?;

          if (receiptData == null) {
            return Center(child: Text('No data found'));
          }

          // Assuming receipt data structure
          List<ReceiptItem> items = List.from(receiptData['items'].map((item) => ReceiptItem(
            name: item['name'],
            price: item['price'].toDouble(),
            quantity: item['quantity'],
          )));

          double totalAmount = receiptData['totalAmount'].toDouble();
          //DateTime dateTime = receiptData['dateTime'].toDate();

          // Show dialog to inform the user that their order has been placed
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Order Placed'),
                content: Text('Your order has been successfully placed.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          });

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date:', //${dateTime.toString()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Items:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Price: ${item.price} x ${item.quantity}'),
                        trailing: Text('Total: ${item.price * item.quantity}'),
                      );
                    },
                  ),
                ),
                Divider(),
                SizedBox(height: 8),
                Text(
                  'Total Amount: $totalAmount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      );
  }
}

class ReceiptItem {
  final String name;
  final double price;
  final int quantity;

  ReceiptItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
