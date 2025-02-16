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
          menuMaxHeight: 350,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
          value: selectedFromValue,
          items:
              currencies.keys
                  .map(
                    (key) => DropdownMenuItem(
                      value: key,
                      child: Text(
                        key,
                        style: TextStyle(
                          color:
                              selectedFromValue == key
                                  ? Colors.blueAccent
                                  : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChangedFrom,
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blueAccent),
        ),
        SizedBox(height: 24.0),
        Text("To", style: TextStyle(fontSize: 24.0)),
        SizedBox(height: 12.0),
        DropdownButtonFormField(
          menuMaxHeight: 350,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
          value: selectedToValue,
          items:
              currencies.keys
                  .map(
                    (key) => DropdownMenuItem(
                      value: key,
                      child: Text(
                        key,
                        style: TextStyle(
                          color:
                              selectedToValue == key ? Colors.blueAccent : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChangedTo,
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blueAccent),
        ),
      ],
    );
  }
}
