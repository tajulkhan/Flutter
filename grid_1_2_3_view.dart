import 'package:flutter/material.dart';
import 'package:rapiddine/configs/colors.dart';
import 'package:rapiddine/view/dining/dining_room.dart';
import 'package:rapiddine/widgets/cs_appbar.dart';
import 'package:rapiddine/widgets/cs_text_field.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int count = 0;
  String _selectedCategory = "All";
  final Map<String, String> categoryData = {
    "All": "All the items are displayed here.",
    "Starter": "Start with appetizers!",
    "Main Course": "Main dishes to fill you up.",
    "Beverages": "Refresh yourself with drinks.",
  };
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Biriyani',
      'price': 120,
      'category': 'Pizza',
      'image': 'assets/img/biriyani.png',
    },
    {
      'name': 'Thalapaakat Biriyani',
      'price': 150,
      'category': 'Burger',
      'image': 'assets/img/biriyani.png',
    },
  ];

  String currentLayout = '1-column';

  final Map<String, int> itemCounts = {};

  void changeLayout(String layout) {
    setState(() {
      currentLayout = layout;
    });
  }

  // Handle item count increase
  void increaseCount(String itemName) {
    setState(() {
      itemCounts[itemName] = (itemCounts[itemName] ?? 0) + 1;
    });
  }

  void decreaseCount(String itemName) {
    setState(() {
      if ((itemCounts[itemName] ?? 0) > 0) {
        itemCounts[itemName] = itemCounts[itemName]! - 1;
      }
    });
  }

  // Build the layout dynamically based on the current layout type
  Widget buildLayout() {
    if (currentLayout == '1-column') {
      return OneColumnLayout(
        menuItems: menuItems,
        itemCounts: itemCounts,
        increaseCount: increaseCount,
        decreaseCount: decreaseCount,
      );
    } else if (currentLayout == '2-column') {
      return TwoColumnLayout(
        menuItems: menuItems,
        itemCounts: itemCounts,
        increaseCount: increaseCount,
        decreaseCount: decreaseCount,
      );
    } else {
      return SingleLayout(
        menuItems: menuItems,
        itemCounts: itemCounts,
        increaseCount: increaseCount,
        decreaseCount: decreaseCount,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondarybg,
      appBar: CustomAppBar(
        title: "Menu",
        backgroundColor: Colors.white,
        showBackButton: true,
        onBackPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiningRoom()),
          );
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: CustomTextField(hintText: "Search"),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => changeLayout('1-column'),
                        child: Image.asset(
                          "assets/img/icon/layout-panel-top.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => changeLayout('2-column'),
                        child: Image.asset(
                          "assets/img/icon/layout-grid.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => changeLayout('single'),
                        child: Image.asset(
                          "assets/img/icon/layout-list.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryButton("All"),
                        SizedBox(width: 10),
                        _buildCategoryButton("Starter"),
                        SizedBox(width: 10),
                        _buildCategoryButton("Main Course"),
                        SizedBox(width: 10),
                        _buildCategoryButton("Beverages"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    categoryData[_selectedCategory] ?? '',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  buildLayout(), // Dynamically build layout based on currentLayout
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label) {
    bool isSelected = _selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF5722) : Colors.white,
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 1. Column Layout
class OneColumnLayout extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;
  final Map<String, int> itemCounts;
  final Function(String) increaseCount;
  final Function(String) decreaseCount;

  OneColumnLayout({
    required this.menuItems,
    required this.itemCounts,
    required this.increaseCount,
    required this.decreaseCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        var item = menuItems[index];
        return buildSingleLayout(item);
      },
    );
  }

  Widget buildSingleLayout(Map<String, dynamic> item) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              item['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  "₹${item['price']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                buildCounterButtons(item['name']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCounterButtons(String itemName) {
    return Container(
      height: 38,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          counterButton('assets/img/icon/minus-ic.png', () => decreaseCount(itemName)),
          Text(
            '${itemCounts[itemName] ?? 0}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          counterButton('assets/img/icon/add-ic.png', () => increaseCount(itemName)),
        ],
      ),
    );
  }

  Widget counterButton(String iconPath, VoidCallback onPressed) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xFFDDDDDD), width: 1),
          ),
          shadowColor: Colors.transparent,
        ),
        child: ImageIcon(
          AssetImage(iconPath),
          size: 26.0,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

// 2. Two Column Layout
class TwoColumnLayout extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;
  final Map<String, int> itemCounts;
  final Function(String) increaseCount;
  final Function(String) decreaseCount;

  TwoColumnLayout({
    required this.menuItems,
    required this.itemCounts,
    required this.increaseCount,
    required this.decreaseCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        var item = menuItems[index];
        return buildGridItem(item);
      },
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            child: Image.asset(
              item['image'],
              width: double.infinity,
              height: 124,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹${item['price']}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  height: 38,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      counterButton('assets/img/icon/minus-ic.png', () => decreaseCount(item['name'])),
                      Text(
                        '${itemCounts[item['name']] ?? 0}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      counterButton('assets/img/icon/add-ic.png', () => increaseCount(item['name'])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget counterButton(String iconPath, VoidCallback onPressed) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xFFDDDDDD), width: 1),
          ),
          shadowColor: Colors.transparent,
        ),
        child: ImageIcon(
          AssetImage(iconPath),
          size: 26.0,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

// 3. Single Layout
class SingleLayout extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;
  final Map<String, int> itemCounts;
  final Function(String) increaseCount;
  final Function(String) decreaseCount;

  SingleLayout({
    required this.menuItems,
    required this.itemCounts,
    required this.increaseCount,
    required this.decreaseCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        var item = menuItems[index];
        return buildSingleLayout(item);
      },
    );
  }

  Widget buildSingleLayout(Map<String, dynamic> item) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              item['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  "₹${item['price']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                buildCounterButtons(item['name']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCounterButtons(String itemName) {
    return Container(
      height: 38,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          counterButton('assets/img/icon/minus-ic.png', () => decreaseCount(itemName)),
          Text(
            '${itemCounts[itemName] ?? 0}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          counterButton('assets/img/icon/add-ic.png', () => increaseCount(itemName)),
        ],
      ),
    );
  }

  Widget counterButton(String iconPath, VoidCallback onPressed) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xFFDDDDDD), width: 1),
          ),
          shadowColor: Colors.transparent,
        ),
        child: ImageIcon(
          AssetImage(iconPath),
          size: 26.0,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
