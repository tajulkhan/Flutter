import 'package:flutter/material.dart';

class HorizontalScrollExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Scroll Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Horizontal scroll view for text items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Set horizontal scroll
              child: Row(
                children: [
                  _buildCategoryButton('All'),
                  SizedBox(width: 16),
                  _buildCategoryButton('Starter'),
                  SizedBox(width: 16),
                  _buildCategoryButton('Main Course'),
                  SizedBox(width: 16),
                  _buildCategoryButton('Beverages'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to build each category button with text
  Widget _buildCategoryButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HorizontalScrollExample(),
  ));
}
