import 'package:flutter/material.dart';
import 'custom_text_field.dart'; // Import the custom widget

class HomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Name",
              hintText: "Enter your name",
              controller: nameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              hintText: "Enter your password",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
