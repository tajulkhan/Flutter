// Find Duplicates in a List
List<int> findDuplicates(List<int> numbers) {
  Map<int, int> countMap = {};
  List<int> duplicates = [];

  for (int num in numbers) {
    countMap[num] = (countMap[num] ?? 0) + 1;
    if (countMap[num] == 2) {
      duplicates.add(num);
    }
  }
  
  return duplicates;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 2, 3, 6, 7, 8, 8, 9];
  print(findDuplicates(numbers)); // Output: [2, 3, 8]

// Remove Duplicates from a List
  List<int> removeDuplicates(List<int> numbers) {
  return numbers.toSet().toList();
}

void main() {
  List<int> numbers = [10, 20, 10, 30, 40, 30, 50];
  print(removeDuplicates(numbers)); // Output: [10, 20, 30, 40, 50]
}


