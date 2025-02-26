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
  List<Map<String, dynamic>> starterItems = [
    {"name": "Cutlet", "price": "₹90", "isChecked": false},
    {"name": "Chicken", "price": "₹100", "isChecked": false},
    {"name": "Paneer Tikka", "price": "₹120", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Starter Menu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: starterItems.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  starterItems[index]["name"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  starterItems[index]["price"],
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                trailing: IconButton(
                  icon: Icon(
                    starterItems[index]["isChecked"]
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: starterItems[index]["isChecked"] ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      starterItems[index]["isChecked"] = !starterItems[index]["isChecked"];
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
