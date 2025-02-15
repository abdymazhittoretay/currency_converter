import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _apiKey = dotenv.env['APIKEY'] ?? "";

  final Map<String, dynamic> _currencies = {};

  Future _getCurrency() async {
    var response = await http.get(
      Uri.https("api.currencyapi.com", "/v3/latest", {"apikey": _apiKey}),
    );
    var jsonData = jsonDecode(response.body);
    jsonData["data"].forEach((key, value) {
      _currencies[key] = {"code": value["code"], "value": value["value"]};
    });
  }

  @override
  void initState() {
    _getCurrency();

    super.initState();
  }

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
