import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodMenuScreen(),
    );
  }
}

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  // Sample categories for the app bar
  final List<String> categories = ['Pizza', 'Burger', 'Pasta', 'Salads'];

  // Sample menu items
  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Margherita Pizza', 'price': 12.99, 'category': 'Pizza', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Cheese Burger', 'price': 9.99, 'category': 'Burger', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Pasta Alfredo', 'price': 14.99, 'category': 'Pasta', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Caesar Salad', 'price': 7.99, 'category': 'Salads', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Pepperoni Pizza', 'price': 15.99, 'category': 'Pizza', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Veggie Burger', 'price': 10.99, 'category': 'Burger', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Penne Arrabbiata', 'price': 13.99, 'category': 'Pasta', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Greek Salad', 'price': 8.99, 'category': 'Salads', 'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
  ];

  // To keep track of item counts
  final Map<String, int> itemCounts = {};

  // Track the current grid layout type
  String currentLayout = '2-column';

  // Handle item count increase
  void increaseCount(String itemName) {
    setState(() {
      itemCounts[itemName] = (itemCounts[itemName] ?? 0) + 1;
    });
  }

  // Handle item count decrease
  void decreaseCount(String itemName) {
    setState(() {
      if (itemCounts[itemName]! > 0) {
        itemCounts[itemName] = itemCounts[itemName]! - 1;
      }
    });
  }

  // Change layout logic
  void changeLayout(String layout) {
    setState(() {
      currentLayout = layout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Logic to filter items by category can be added here
                      print("Selected Category: ${categories[index]}");
                    },
                    child: Chip(
                      label: Text(categories[index]),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // AppBar: Buttons to change layout
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => changeLayout('2-column'),
                  child: Text('2 Column'),
                ),
                ElevatedButton(
                  onPressed: () => changeLayout('1-column'),
                  child: Text('1 Column'),
                ),
                ElevatedButton(
                  onPressed: () => changeLayout('single'),
                  child: Text('Single'),
                ),
              ],
            ),
          ),
          // Menu Grid View
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: currentLayout == '2-column'
                      ? 2
                      : 1, // Adjust based on layout
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: currentLayout == '2-column'
                      ? 1
                      : 2.0, // Larger items for single column view
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  var item = menuItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: currentLayout == 'single'
                          ? buildSingleLayout(item)
                          : buildGridItem(item),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(item['image'], height: 80, width: 100),
        SizedBox(height: 10),
        Text(
          item['name'],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text("\$${item['price']}", style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
        // Add, count, and minus buttons
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => decreaseCount(item['name']),
            ),
            Text(
              "${itemCounts[item['name']] ?? 0}",
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => increaseCount(item['name']),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSingleLayout(Map<String, dynamic> item) {
    return Row(
      children: [
        // Title and price on the left
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("\$${item['price']}", style: TextStyle(fontSize: 14)),
          ],
        ),
        Spacer(),
        // Image on the right
        Image.network(item['image'], height: 60, width: 60),
        SizedBox(width: 10),
        // Add, count, and minus buttons on the right
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => decreaseCount(item['name']),
            ),
            Text(
              "${itemCounts[item['name']] ?? 0}",
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => increaseCount(item['name']),
            ),
          ],
        ),
      ],
    );
  }
}
