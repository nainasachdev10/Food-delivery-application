import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Implement your payment processing logic here
            // Example: using Firestore to store payment information
            await FirebaseFirestore.instance.collection('payments').add({
              'userId': FirebaseAuth.instance.currentUser!.uid,
              'amount': 100, // Example amount
              'timestamp': DateTime.now(),
            });

            // Show payment success message
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Payment Confirmation'),
                  content: Text('Your payment was successful!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}