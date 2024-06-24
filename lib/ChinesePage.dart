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
      home: ChinesePage(),
    );
  }
}

class ChinesePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chinese'), backgroundColor: Color(0xFF84A98C),
      ),
      body: ListView(
        children: [
          FoodItemCard(
            name: 'Chinese Dumplings',
            price: 130,
            image: 'assets/chinese dumpling.jpg',
          ),
          FoodItemCard(
            name: 'Chinese Manchurian',
            price: 220,
            image: 'assets/chinese manchurian.jpg',
          ),FoodItemCard(
            name: 'Chinese Spring Rolls',
            price: 220,
            image: 'assets/chinese spring rolls.jpg',
          ),FoodItemCard(
            name: 'Chinese Fried Rice',
            price: 250,
            image: 'assets/chinesefriedrice.jpg',
          ),FoodItemCard(
            name: 'Noodle Soup',
            price: 250,
            image: 'assets/noodlesoup.jpg',
          ),
          FoodItemCard(
            name: 'Noodles',
            price: 80,
            image: 'assets/noodle1.jpg',
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
