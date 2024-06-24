import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:android_food_app/MyPage.dart'; // Replace with the actual path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF84A98C), // Set the primary color
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/MyPage': (context) => MyPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              /*
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2)); // Simulate login process
                setState(() {
                  _isLoading = false;
                });
                Navigator.pushReplacementNamed(context, '/MyPage');
              },
              */
              onPressed: () async {
                try {
                  FirebaseAuth _auth = FirebaseAuth.instance;

                  UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                    email: _usernameController.text,
                    password: _passwordController.text,
                  );
                  // Login successful, handle further actions like navigation
                  print("Login successful");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPage()));

                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: _isLoading ? CircularProgressIndicator() : Text('Login'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Login with Google logic
                  },
                  icon: Icon(Icons.ac_unit), // Replace with Google icon
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    // Login with Facebook logic
                  },
                  icon: Icon(Icons.access_alarm), // Replace with Facebook icon
                ),
              ],
            ),
            // Other UI elements like forgot password link, etc.
          ],
        ),
      ),
    );
  }
}

// Do not include the MyPage widget here, as it already exists in another file.


