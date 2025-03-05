import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String input = "";
  double total = 0;

  void onButtonPressed(String value) {
    setState(() {
      if (value == "Back") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "Add") {
        total += double.tryParse(input) ?? 0;
        input = "";
      } else {
        input += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: Text("Total: \$${total.toStringAsFixed(2)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            "7", "8", "9", "Back",
            "4", "5", "6", "X",
            "1", "2", "3", "",
            "0", "00", ".", "Add"
          ].map((text) => _buildButton(text)).toList(),
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: text.isEmpty ? null : () => onButtonPressed(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        textStyle: TextStyle(fontSize: 18),
      ),
      child: Text(text),
    );
  }
}
