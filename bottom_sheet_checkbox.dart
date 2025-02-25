import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define boolean variables for checkbox states
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  // Function to show the BottomSheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(  // This allows the bottom sheet to maintain its state
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CheckboxListTile(
                    title: Text('Option 1'),
                    value: checkbox1,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox1 = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Option 2'),
                    value: checkbox2,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox2 = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Option 3'),
                    value: checkbox3,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox3 = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // You can do something with the selected checkbox values here
                      print('Checkbox 1: $checkbox1');
                      print('Checkbox 2: $checkbox2');
                      print('Checkbox 3: $checkbox3');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BottomSheet with Checkbox'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: Text('Show BottomSheet'),
        ),
      ),
    );
  }
}
