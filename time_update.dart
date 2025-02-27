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
  String formattedTime = '';
  late Timer _timer; // Declare the Timer

  @override
  void initState() {
    super.initState();
    formattedTime = getFormattedTime(); // Set the initial time

    // Set up the Timer to update the time every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        formattedTime = getFormattedTime(); // Update time every second
      });
    });
  }

  // Function to get the formatted time in "hh:mm a" format
  String getFormattedTime() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm a').format(now); // Format time as "hh:mm AM/PM"
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          formattedTime, // Display the formatted time
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
