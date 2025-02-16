import 'package:flutter/material.dart';

class DropdownMenus extends StatelessWidget {
  final Map<String, dynamic> currencies;
  final String? selectedFromValue;
  final String? selectedToValue;
  final void Function(String?)? onChangedFrom;
  final void Function(String?)? onChangedTo;

  const DropdownMenus({
    super.key,
    required this.currencies,
    required this.selectedFromValue,
    required this.selectedToValue,
    required this.onChangedFrom,
    required this.onChangedTo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("From", style: TextStyle(fontSize: 24.0)),
        SizedBox(height: 12.0),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
          ),
          value: selectedFromValue,
          items:
              currencies.keys
                  .map((key) => DropdownMenuItem(value: key, child: Text(key)))
                  .toList(),
          onChanged: onChangedFrom,
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blueAccent),
        ),
        SizedBox(height: 24.0),
        Text("To", style: TextStyle(fontSize: 24.0)),
        SizedBox(height: 12.0),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
          ),
          value: selectedToValue,
          items:
              currencies.keys
                  .map((key) => DropdownMenuItem(value: key, child: Text(key)))
                  .toList(),
          onChanged: onChangedTo,
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blueAccent),
        ),
      ],
    );
  }
}
