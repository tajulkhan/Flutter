import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyTimeWidget(),
  ));
}

class MyTimeWidget extends StatefulWidget {
  @override
  _MyTimeWidgetState createState() => _MyTimeWidgetState();
}

class _MyTimeWidgetState extends State<MyTimeWidget> {
  // Initialize formattedTime with the current time
  String formattedTime = '';

  @override
  void initState() {
    super.initState();
    // Set the initial formatted time
    formattedTime = getFormattedTime();

    // Create a Timer that updates the time every second
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        formattedTime = getFormattedTime(); // Update the formatted time
      });
    });
  }

  // Function to get the formatted time in the desired format
  String getFormattedTime() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm a').format(now); // Format time as "hh:mm AM/PM"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set a background color
      body: Center(
        child: Text(
          formattedTime, // Directly display the formatted time
          style: TextStyle(
            color: Colors.white, // Set the text color to white
            fontSize: 48, // Increase font size for better visibility
            fontWeight: FontWeight.w600, // Set font weight
          ),
        ),
      ),
    );
  }
}
