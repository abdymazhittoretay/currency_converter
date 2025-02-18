import 'dart:convert';

import 'package:currency_converter_app/widgets/amount_textfield.dart';
import 'package:currency_converter_app/widgets/convert_button.dart';
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

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _resultController = TextEditingController();

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
                SizedBox(height: 10.0),
                _currencies.isNotEmpty
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownMenus(
                          currencies: _currencies,
                          selectedFromValue: _selectedFromValue,
                          selectedToValue: _selectedToValue,
                          onChangedFrom: onChangedFrom,
                          onChangedTo: onChangedTo,
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Amount", style: TextStyle(fontSize: 24.0)),
                            Text(
                              "$_selectedFromValue",
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        AmountTextfield(controller: _amountController),
                        SizedBox(height: 24.0),
                        ConvertButton(onPressed: convert),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Result", style: TextStyle(fontSize: 24.0)),
                            Text(
                              "$_selectedToValue",
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        TextField(
                          enabled: false,
                          controller: _resultController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
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
    convert();
  }

  void onChangedTo(value) {
    setState(() {
      _selectedToValue = value;
    });
    convert();
  }

  void convert() {
    if (double.tryParse(_amountController.text) == null) return;
    final num fromValue = _currencies[_selectedFromValue];
    final num toValue = _currencies[_selectedToValue];
    final num amount = double.tryParse(_amountController.text) ?? 1.0;
    _resultController.text = (toValue / fromValue * amount).toStringAsFixed(2);
  }
}
