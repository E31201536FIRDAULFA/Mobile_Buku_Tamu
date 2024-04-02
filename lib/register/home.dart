import 'package:flutter/material.dart';
import 'package:flutterku/register/login_page.dart';

import '../main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantau Tamu Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent background
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 218, 203, 7),
                  Colors.white
                ], // Gradient colors: gold to white
              ),
            ),
          ),
          Positioned(
            top: -50, // Adjust as needed
            left: -50, // Adjust as needed
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 218, 203, 7).withOpacity(0.2)
                  ], // Gradient colors: white to slightly gold
                ),
              ),
            ),
          ),
          Positioned(
            top: -100, // Adjust as needed
            left: -100, // Adjust as needed
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 218, 203, 7).withOpacity(0.2)
                  ], // Gradient colors: white to slightly gold
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50, // Adjust as needed
            right: -50, // Adjust as needed
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 218, 203, 7).withOpacity(0.2)
                  ], // Gradient colors: white to slightly gold
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100, // Adjust as needed
            right: -100, // Adjust as needed
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 218, 203, 7).withOpacity(0.2)
                  ], // Gradient colors: white to slightly gold
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'img/logomdr.png', // Replace 'your_image.png' with your image asset path
                  width: 150, // Adjust as needed
                  height: 150, // Adjust as needed
                ),
                SizedBox(height: 20.0), // Spacing
                Text(
                  'Pantau Tamu Pro',
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DynamicFont', // Set dynamic font family
                  ),
                ),
                SizedBox(height: 30.0), // Spacing
                ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => LoginPage(userData: UserData()),
                    );
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Button background color
                    onPrimary:
                        Color.fromARGB(255, 206, 193, 8), // Button text color
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
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
