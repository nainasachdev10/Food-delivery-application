import 'package:android_food_app/ChinesePage.dart';
import 'package:android_food_app/Drinks.dart';
import 'package:android_food_app/Italian.dart';
import 'package:android_food_app/MenuPage.dart';
import 'package:android_food_app/SignupApp.dart';
import 'package:android_food_app/South.dart';
import 'package:android_food_app/cartPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:android_food_app/HomePage.dart'; // Correct the import path for HomePage
import 'package:android_food_app/MyPage.dart';
import 'package:android_food_app/_LoginPageState.dart';// Correct the import path for Page2
import 'CartItem.dart';
void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NomNom Delights',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F3),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue), // Use 'fromSwatch' instead of 'fromSeed'
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // Define the route for HomePage with '/'
        '/SignupApp': (context) => SignupApp(),
        '/MyPage': (context) => MyPage(),
        '/MenuPage': (context) => MenuPage(),
        '/South': (context) => South(),
        '/ChinesePage': (context) => ChinesePage(),
        '/Drinks': (context) => Drinks(),
        '/Italian': (context) => Italian(),
        '/LoginPage':(context) => LoginPage()

      },
    );
  }
}
