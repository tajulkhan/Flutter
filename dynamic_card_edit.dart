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
    {"name": "Cutlet", "price": "₹90", "isChecked": false, "isEditing": false},
    {"name": "Chicken", "price": "₹100", "isChecked": false, "isEditing": false},
    {"name": "Paneer Tikka", "price": "₹120", "isChecked": false, "isEditing": false},
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void _toggleEdit(int index) {
    setState(() {
      starterItems[index]["isEditing"] = !starterItems[index]["isEditing"];

      if (starterItems[index]["isEditing"]) {
        _nameController.text = starterItems[index]["name"];
        _priceController.text = starterItems[index]["price"];
      } else {
        starterItems[index]["name"] = _nameController.text;
        starterItems[index]["price"] = _priceController.text;
      }
    });
  }

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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: starterItems[index]["isEditing"]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: "Food Name"),
                          ),
                          TextField(
                            controller: _priceController,
                            decoration: InputDecoration(labelText: "Price"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => _toggleEdit(index),
                                child: Text("Save", style: TextStyle(color: Colors.green)),
                              ),
                            ],
                          )
                        ],
                      )
                    : ListTile(
                        title: Text(
                          starterItems[index]["name"],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          starterItems[index]["price"],
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
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
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _toggleEdit(index),
                            ),
                          ],
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
