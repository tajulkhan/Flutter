import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("CheckboxListTile Example")),
        body: MyCheckboxList(),
      ),
    );
  }
}

class MyCheckboxList extends StatefulWidget {
  @override
  _MyCheckboxListState createState() => _MyCheckboxListState();
}

class _MyCheckboxListState extends State<MyCheckboxList> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckboxListTile(
          title: Text("Option 1"),
          subtitle: Text("This is option 1"),
          value: _isChecked1,
          onChanged: (bool? value) {
            setState(() {
              _isChecked1 = value ?? false;
            });
          },
          activeColor: Colors.green,  // When checked, green color will be used
          checkColor: Colors.white,   // Color of the check mark
          controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
        ),
        CheckboxListTile(
          title: Text("Option 2"),
          subtitle: Text("This is option 2"),
          value: _isChecked2,
          onChanged: (bool? value) {
            setState(() {
              _isChecked2 = value ?? false;
            });
          },
          activeColor: Colors.blue,  // When checked, blue color will be used
          checkColor: Colors.white,  // Color of the check mark
          controlAffinity: ListTileControlAffinity.trailing, // Checkbox on the right
        ),
      ],
    );
  }
}
