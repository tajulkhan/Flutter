import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TableSelectionScreen(), // Start with the TableSelectionScreen
    );
  }
}

class TableSelectionScreen extends StatelessWidget {
  // List of tables with their names and statuses
  final List<Map<String, String>> tables = [
    {'name': 'Table 1', 'status': 'Available'},
    {'name': 'Table 2', 'status': 'Occupied'},
    {'name': 'Table 3', 'status': 'Partially Occupied'},
    {'name': 'Table 4', 'status': 'Available'},
    {'name': 'Table 5', 'status': 'Occupied'},
    {'name': 'Table 6', 'status': 'Available'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Table"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: tables.length,
          itemBuilder: (context, index) {
            var table = tables[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the order screen if the table is available
                if (table['status'] == 'Available') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(tableName: table['name']!),
                    ),
                  );
                } else {
                  // Show a dialog if the table is not available
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Table Unavailable"),
                        content: Text("This table is ${table['status']} and cannot be used right now."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _getTableColor(table['status']!),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4),
                  ],
                ),
                child: Center(
                  child: Text(
                    table['name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Get the background color based on the table's status
  Color _getTableColor(String status) {
    switch (status) {
      case 'Available':
        return Colors.green;  // Available tables are green
      case 'Occupied':
        return Colors.red;    // Occupied tables are red
      case 'Partially Occupied':
        return Colors.orange; // Partially Occupied tables are orange
      default:
        return Colors.grey;   // Default color for any other status
    }
  }
}

class OrderScreen extends StatelessWidget {
  final String tableName;

  const OrderScreen({super.key, required this.tableName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order for $tableName")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Taking order for $tableName",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the order logic here
                print("Order taken for $tableName");
                // You can also navigate to another screen or show a confirmation.
              },
              child: Text("Submit Order"),
            ),
          ],
        ),
      ),
    );
  }
}
