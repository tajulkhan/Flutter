class _MenuScreenState extends State<MenuScreen> {
  String _selectedCategory = "All"; // Default category selection

  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Biriyani', 'price': 120, 'category': 'Main Course', 'image': 'assets/img/biriyani.png'},
    {'name': 'Chicken Wings', 'price': 150, 'category': 'Starter', 'image': 'assets/img/wings.png'},
    {'name': 'Thalapaakat Biriyani', 'price': 130, 'category': 'Main Course', 'image': 'assets/img/biriyani.png'},
    {'name': 'Cold Coffee', 'price': 100, 'category': 'Beverages', 'image': 'assets/img/coffee.png'},
  ];

  List<Map<String, dynamic>> get filteredMenuItems {
    return menuItems.where((item) {
      return _selectedCategory == "All" || item['category'] == _selectedCategory;
    }).toList();
  }

  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedCategory == category ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: _selectedCategory == category ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // **Category Selection - Horizontal Scroll**
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

        SizedBox(height: 16),

        // **Filtered Grid View**
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust based on your layout
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 164 / 200,
            ),
            itemCount: filteredMenuItems.length,
            itemBuilder: (context, index) {
              var item = filteredMenuItems[index];

              return Container(
                width: 164,
                height: 182,
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item['image'], width: 80, height: 80),
                    Text(item['name'], style: TextStyle(fontSize: 16)),
                    Text("₹${item['price']}", style: TextStyle(fontSize: 14, color: Colors.green)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
