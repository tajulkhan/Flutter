String formatCategoryName(String category) {
  List<String> words = category.split('_'); // Split by underscore
  return words.map((word) => '${word[0].toUpperCase()}${word.substring(1)}').join(' '); 
}
Text(
  formatCategoryName(category["category"]),
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
),

// Duplicate an Item (Map) Inside a Firestore Document
food_menu (collection)
  ├── starters (document)
  │     ├── items: [
  │          {"name": "Cutlet", "price": 90, "isChecked": false},
  │          {"name": "Chicken", "price": 100, "isChecked": false}
  │        ]
