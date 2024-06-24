import 'package:flutter/material.dart';
import 'CartItem.dart';
import 'checkout.dart'; // Importing checkout.dart file

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems; // Define a list of cart items

  CartPage({required this.cartItems}); // Include the constructor to pass cart items

  // Method to handle the checkout process
  void checkout(BuildContext context) {
    // Implement the logic to perform the checkout process
    // For example, navigating to the checkout page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutPage(cartItems: cartItems)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF84A98C),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index].name),
                    subtitle: Text(
                      'Price: \INR${cartItems[index].price.toStringAsFixed(2)}'
                          '\nQuantity: ${cartItems[index].quantity}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        // Implement logic to remove the item from the cart
                        // You may need to update the cartItems list
                      },
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \INR${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Call the checkout method
                checkout(context);
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
