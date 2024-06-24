import 'package:android_food_app/ChinesePage.dart';
import 'package:android_food_app/Drinks.dart';
import 'package:android_food_app/HomePage.dart';
import 'package:android_food_app/Italian.dart';
import 'package:android_food_app/MenuPage.dart';
import 'package:android_food_app/Punjabi.dart';
import 'package:android_food_app/South.dart';
import 'package:android_food_app/Setting.dart';
import 'package:android_food_app/CartPage.dart';
import 'package:android_food_app/_LoginPageState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:android_food_app/CartItem.dart';
import 'package:android_food_app/CartPage.dart';
import 'Setting.dart';
import 'package:android_food_app/checkout.dart';

// Define the CartPage class here before using it in the routes map


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      routes: {
        '/cart': (context) => CartPage(cartItems: cartItems), // Now CartPage is defined before usage
      },
    );
  }
}

class MyPage extends StatefulWidget {


  @override
  MyPageState createState() => MyPageState();
}

// ... Rest of your code remains unchanged


class MyPageState extends State<MyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CartItem> cartItems = [];

  // Function to open the drawer
  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  Widget categoriesContainer({required String image, required String name,required String category}) {
    return GestureDetector(
      onTap: () {
        switch (category) {
          case 'North Indian':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MenuPage(),
              ),
            );
            break;
          case 'Chinese':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChinesePage(),
              ),
            );
            break;
          case 'All':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyPage(),
              ),
            );
            break;;
          case 'Punjabi':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Punjabi(),
              ),
            );
            break;
          case 'South Indian':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => South(),
              ),
            );
            break;
          case 'Italian':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Italian(),
              ),
            );
            break;
          case 'Drinks':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Drinks(),
              ),
            );
            break;
        // Add more cases for other categories
          default:
          // Handle other cases or show an error message
            break;
        }
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }


  Widget bottomContainer(
      {required String image, required int price, required String name}) {
    return GestureDetector( // Wrap with GestureDetector for navigation
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(cartItems: cartItems),
          ),
        );
      },
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: Color(0xFF84A98C), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(image),
            ),SizedBox(height: 10), // Add spacing between food name and INR
            Text(
              name,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "INR $price", // Display INR below the food name
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add the scaffold key here
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: openDrawer, // Use the function to open the drawer
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/prof.jpg'),
            ),
          )
        ],
      ),
      drawer: AppDrawer(), // Include the AppDrawer here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "SEARCH FOOD",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFF84A98C),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoriesContainer(
                  image: 'assets/paneer1.jpg',
                  name: "All",
                  category: 'All',
                ),
                categoriesContainer(
                  image: 'assets/paneertikkamasala.jpg',
                  name: "North Indian",
                  category: 'North Indian',
                ),
                categoriesContainer(
                  image: 'assets/noodle1.jpg',
                  name: "Chinese",
                  category: 'Chinese',
                ),
                categoriesContainer(
                  image: 'assets/cholebhature1.jpg',
                  name: "Punjabi",
                  category: 'Punjabi',
                ),
                categoriesContainer(
                  image: 'assets/dosa1.jpg',
                  name: "South Indian",
                  category: 'South Indian',
                ),
                categoriesContainer(
                  image: 'assets/pasta1.jpg',
                  name: "Italian",
                  category: 'Italian',
                ),
                categoriesContainer(
                  image: 'assets/colddrink1.jpg',
                  name: "Drinks",
                  category: 'Drinks',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 520,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                bottomContainer(
                  image: 'assets/pizza2.jpg',
                  name: ' Onion Pizza',
                  price: 300,
                ),
                bottomContainer(
                  image: 'assets/buger1.jpg',
                  name: 'Burger',
                  price: 150,
                ),
                bottomContainer(
                  image: 'assets/chole2.jpg',
                  name: 'Chole Bhature',
                  price: 120,
                ),
                bottomContainer(
                  image: 'assets/dosa1.jpg',
                  name: ' Masala Dosa',
                  price: 100,
                ),bottomContainer(
                  image: 'assets/pasta1.jpg',
                  name: ' White Sauce Pasta',
                  price: 300,
                ),
                bottomContainer(
                  image: 'assets/vegkolhapuri.jpg',
                  name: ' Veg Kolhapuri',
                  price: 220,
                ),
                bottomContainer(
                  image: 'assets/idli.jpg',
                  name: ' Idli',
                  price: 80,
                ),
                bottomContainer(
                  image: 'assets/meduvada.jpg',
                  name: ' Medu Vada',
                  price: 100,
                ),
                bottomContainer(
                  image: 'assets/dosa1.jpg',
                  name: ' Masala Dosa',
                  price: 100,
                ),
                bottomContainer(
                  image: 'assets/noodle1.jpg',
                  name: ' Hakka Noodles',
                  price: 180,
                ),
                bottomContainer(
                  image: 'assets/biryani1.jpg',
                  name: 'Biryani',
                  price: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 // Import the file where CartPage is defined





class DetailPage extends StatefulWidget {
  final List<CartItem> cartItems;

  DetailPage({required this.cartItems});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _quantity = 1; // Variable to track quantity

  void addToCart() {
    widget.cartItems.add(CartItem(name: "Onion Pizza", price: 300.0, quantity: _quantity)); // Add item with current quantity to cart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/pizza2.jpg"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF84A98C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Onion Pizza",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Special Pizza",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "INR 300",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_quantity > 1) _quantity--; // Decrease quantity
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$_quantity",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _quantity++; // Increase quantity
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    """Experience pizza perfection with our Onion Delight Pizza! 
Thin, crispy crust loaded with caramelized sweet onions, 
creamy mozzarella, and fresh herbs. 
A savory sensation in every bite. 
Order now for a taste adventure!""",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        addToCart(); // Add item to cart with current quantity
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(cartItems: widget.cartItems),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "ADD TO CART",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






 // Import your SettingsPage

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF84A98C),
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
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(cartItems: cartItems),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings screen
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Setting()), // Remove the extra builder and extra semicolon
              ); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Log Out'),
            onTap: () {
// Navigate to the home screen
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); // Close the drawer
            });

            },
          ),
        ],
      ),
    );
  }
}
