import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      primaryColor: Color(0xFF84A98C), // Set the primary color
    ),
      home: Drinks(),
    );
  }
}

class Drinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Italian'), backgroundColor: Color(0xFF84A98C),
      ),
      body: ListView(
        children: [
          FoodItemCard(
            name: 'Rajma Chawal',
            price: 130,
            image: 'assets/rajma.jpg',
          ),
          FoodItemCard(
            name: 'Paneer Butter Masala',
            price: 220,
            image: 'assets/paneerbuttermasala.jpg',
          ),FoodItemCard(
            name: 'Paneer Tikka Masala',
            price: 220,
            image: 'assets/paneertikka.jpg',
          ),FoodItemCard(
            name: 'Paneer Lababdar',
            price: 250,
            image: 'assets/lababdar.jpg',
          ),FoodItemCard(
            name: 'Paneer Handi',
            price: 250,
            image: 'assets/paneerhandi.jpg',
          ),
          FoodItemCard(
            name: 'Paneer Parantha',
            price: 80,
            image: 'assets/paneerparantha.jpg',
          ),
          // Add more FoodItemCard widgets for other menu items
        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;

  FoodItemCard({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Color(0xFF84A98C),
      child: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Price: \INR${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
