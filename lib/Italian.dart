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
      home: Italian(),
    );
  }
}

class Italian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Italian'), backgroundColor: Color(0xFF84A98C),
      ),
      body: ListView(
        children: [
          FoodItemCard(
            name: 'Lasagna',
            price: 130,
            image: 'assets/lasagna.jpg',
          ),
          FoodItemCard(
            name: 'Pasta',
            price: 220,
            image: 'assets/pasta.jpg',
          ),FoodItemCard(
            name: 'Tiramisu',
            price: 220,
            image: 'assets/tiramisu.jpg',
          ),FoodItemCard(
            name: 'Keto panna cotta',
            price: 250,
            image: 'assets/keto panna cota.jpg',
          ),FoodItemCard(
            name: 'Italian Pizza',
            price: 250,
            image: 'assets/pizza1.jpg',
          ),
          FoodItemCard(
            name: 'Italian curry',
            price: 80,
            image: 'assets/italian curry.jpg',
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
