import 'package:flutter/material.dart';

class CategorySelectionExample extends StatefulWidget {
  @override
  _CategorySelectionExampleState createState() =>
      _CategorySelectionExampleState();
}

class _CategorySelectionExampleState extends State<CategorySelectionExample> {
  // Keep track of the selected category
  String _selectedCategory = "All";

  // Data corresponding to each category
  final Map<String, String> categoryData = {
    "All": "All the items are displayed here.",
    "Starter": "Start with appetizers!",
    "Main Course": "Main dishes to fill you up.",
    "Beverages": "Refresh yourself with drinks."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Selection')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Horizontal scrollable buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              child: Row(
                children: [
                  _buildCategoryButton("All"),
                  SizedBox(width: 16),
                  _buildCategoryButton("Starter"),
                  SizedBox(width: 16),
                  _buildCategoryButton("Main Course"),
                  SizedBox(width: 16),
                  _buildCategoryButton("Beverages"),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Display data based on selected category
            Text(
              categoryData[_selectedCategory] ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each category button
  Widget _buildCategoryButton(String label) {
    bool isSelected = _selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF5722) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Color(0xFFFF5722) : Color(0xFFDDDDDD),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF505050),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CategorySelectionExample()));
}
