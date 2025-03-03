import 'package:flutter/material.dart';


class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String currentLayout = '1-column';

  void changeLayout(String layout) {
    setState(() {
      currentLayout = layout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondarybg,
      appBar: CustomAppBar(
        title: "Menu",
        backgroundColor: Colors.white,
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 250, child: CustomTextField(hintText: "Search")),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => changeLayout('1-column'),
                  child: Icon(Icons.view_agenda),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => changeLayout('2-column'),
                  child: Icon(Icons.grid_view),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => changeLayout('single'),
                  child: Icon(Icons.list),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: currentLayout == '1-column'
                  ? OneColumnLayout()
                  : currentLayout == '2-column'
                      ? TwoColumnLayout()
                      : SingleColumnLayout(),
            ),
          ],
        ),
      ),
    );
  }
}

// One Column Layout
class OneColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3,
      ),
      itemCount: 5, // Example count
      itemBuilder: (context, index) {
        return Card(child: Center(child: Text('Item $index')));
      },
    );
  }
}

// Two Column Layout
class TwoColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(child: Center(child: Text('Item $index')));
      },
    );
  }
}

// Single Column Layout
class SingleColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(child: ListTile(title: Text('Item $index')));
      },
    );
  }
}
