import 'package:android_food_app/SignupApp.dart';
import 'package:flutter/material.dart';
import 'MyPage.dart'; // Import the destination page file

class HomePage extends StatefulWidget {
  Widget button({required String name, Color? color, void Function()? onPressed}) {
    return Container(
      height: 55,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed, // Pass the onPressed callback
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your Cravings our Mission!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  widget.button(
                    name: 'Login',
                    color: Color(0xFF84A98C),
                    onPressed: () {
                      // Navigate to Page2 when the "Login" button is pressed
                      Navigator.pushNamed(context, '/LoginPage');
                    },
                  ),
                  widget.button(
                    name: 'Signup',
                    color: Color(0xFF84A98C),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()))
                          .then((value) {
                        // This code will execute when returning from the SignupPage
                        if (value == 'back') {
                          // Use the pop method to go back to the HomePage
                          Navigator.pop(context);
                        }
                      });
                    },
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



