import 'package:android_food_app/_LoginPageState.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NomNom DELIGHTS'),
          backgroundColor: const Color(0xFF84A98C), // Set the background color of the AppBar
        ),
        drawer: AppDrawer(), // Add the drawer here
        body: const Center(
          child: Text(''),
        ),
      ),
    );
  }
}
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF84A98C), // Use the same color at the top
            ),
            child: Text(
              'Food Delivery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
// Navigate to the home screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Menu'),
            onTap: () {
// Navigate to the menu screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
// Navigate to the cart screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
// Navigate to the settings screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Log Out'),
            onTap: () {
// Navigate to the home screen
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
