import 'package:android_food_app/MyPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CartItem.dart'; // Import CartItem class
import 'paymentpage.dart';// Import PaymentPage
import 'RecieptPage.dart';
// Import the CartItem class from the correct file

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cartItems; // Define cartItems here

  CheckoutPage({required this.cartItems}); // Constructor with cartItems parameter

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _addressController = TextEditingController(); // Address controller

  User? user;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    user = _auth.currentUser;
    if (user == null) {
      // Redirect to login page or handle the scenario where the user is not logged in
    }
  }

  // Update address in Firestore
  Future<void> _updateAddress(String address) async {
    if (user != null) {
      await _firestore.collection('users').doc(user!.uid).update({'address': address});
    }
  }

  Future<void> _placeOrder() async {
    if (user != null) {
      // Get user details
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
      await _firestore.collection('users').doc(user!.uid).get();

      // Get cart items from Firestore
      QuerySnapshot<Map<String, dynamic>> cartSnapshot =
      await _firestore.collection('users').doc(user!.uid).collection('cart').get();

      // Process order (e.g., calculate total price, update inventory, etc.)
      // In this example, we'll just print the cart items
      for (QueryDocumentSnapshot<Map<String, dynamic>> item in cartSnapshot.docs) {
        print('Item: ${item.data()}');
      }

      // Clear the cart after placing the order
      await _firestore.collection('users').doc(user!.uid).collection('cart').get().then((snapshot) {
        for (DocumentSnapshot doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      // Navigate to the PaymentPage after placing the order
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(totalAmount: calculateTotal(), cartItems: widget.cartItems.cast<CartItem>()), // Cast to List<CartItem>
        ),
      );

      // Show order confirmation or navigate to a success page
      print('Order placed successfully!');
    }
  }

  // Calculate total amount from cart items
  double calculateTotal() {
    double total = 0;
    for (var item in widget.cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Final Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      'Price: INR ${item.price.toStringAsFixed(2)} | Quantity: ${item.quantity}',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                CollectionReference collRef = FirebaseFirestore.instance.collection('address');
                collRef.add({
                  'address': _addressController.text,
                });
                String address = _addressController.text.trim();
                if (address.isNotEmpty) {
                  // Update address in Firestore
                  await _updateAddress(address);
                  // Place order
                  await _placeOrder();
                  // Show order confirmation or navigate to a success page
                  // You can implement this part based on your requirements
                } else {
                  // Show error if address is empty
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter your address.'),
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
                }
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final double totalAmount;
  final List<CartItem> cartItems;

  PaymentPage({required this.totalAmount, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Build your payment page UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount: $totalAmount',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Price: INR ${item.price} | Quantity: ${item.quantity}'),
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Successfull'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
                          }, child: Text('OK')),
                        ],
                      );
                    }
                );
/*
                User? user = FirebaseAuth.instance.currentUser;

                // Process payment logic
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiptPage(
                    userId: user!.uid,
                    receiptId: '1234'
                )));
*/
              },
              child: Text('Cash on Delivery'),
            ),
          ],
        ),
      ),
    );
  }
}
