class DiningScreen extends StatefulWidget {
  @override
  _DiningScreenState createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen> {
  String selectedTab = "Dine-In"; // Default active tab

  void switchTab(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Dining",
        backgroundColor: Colors.white,
        showBackButton: true,
        onBackPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => switchTab("Dine-In"),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedTab == "Dine-In" ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Dine-In",
                      style: TextStyle(
                        color: selectedTab == "Dine-In" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () => switchTab("Takeaway"),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedTab == "Takeaway" ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Takeaway",
                      style: TextStyle(
                        color: selectedTab == "Takeaway" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("Selected: $selectedTab", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
