import 'dart:convert';

import 'package:currency_converter_app/widgets/dropdown_menus.dart';
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

  String? _selectedFromValue;
  String? _selectedToValue;

  Future _getCurrency() async {
    var response = await http.get(
      Uri.https("api.currencyapi.com", "/v3/latest", {"apikey": _apiKey}),
    );
    var jsonData = jsonDecode(response.body);
    jsonData["data"].forEach((key, value) {
      _currencies[key] = value["value"];
    });
    _selectedFromValue = "USD";
    _selectedToValue = "KZT";

    setState(() {});
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
              mainAxisSize: MainAxisSize.max,
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
                _currencies.isNotEmpty
                    ? DropdownMenus(
                      currencies: _currencies,
                      selectedFromValue: _selectedFromValue,
                      selectedToValue: _selectedToValue,
                      onChangedFrom: onChangedFrom,
                      onChangedTo: onChangedTo,
                    )
                    : Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onChangedFrom(value) {
    setState(() {
      _selectedFromValue = value;
    });
  }

  void onChangedTo(value) {
    setState(() {
      _selectedToValue = value;
    });
  }
}
