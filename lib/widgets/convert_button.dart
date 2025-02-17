import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        minimumSize: Size(
          MediaQuery.sizeOf(context).width,
          80,
        ), // Full width & height
        textStyle: TextStyle(fontSize: 24.0),
      ),
      onPressed: () {},
      child: Text("Convert"),
    );
  }
}
