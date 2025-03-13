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

