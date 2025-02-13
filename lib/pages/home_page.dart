import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Currency\nConverter",
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
