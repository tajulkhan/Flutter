// Advanced Data Structures

// 1.Lists & Advanced List Operations
// Basic List Operations
void main() {
  List<int> numbers = [10, 20, 30, 40, 50];

  print(numbers.first);  // 10
  print(numbers.last);   // 50
  print(numbers.length); // 5

  numbers.add(60); // Add an element
  numbers.remove(20); // Remove an element
  numbers.sort(); // Sort the list

  print(numbers); // Output: [10, 30, 40, 50, 60]
}
// Transform List with .map()
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  var squared = numbers.map((n) => n * n).toList();
  print(squared); // [1, 4, 9, 16, 25]
}
// Filtering with .where()
void main() {
  List<int> numbers = [10, 15, 20, 25, 30];
  var evenNumbers = numbers.where((n) => n.isEven).toList();
  print(evenNumbers); // [10, 20, 30]
}

// 2. Sets, Maps & Hashing Techniques
void main() {
  Set<int> uniqueNumbers = {1, 2, 3, 3, 4, 5};
  uniqueNumbers.add(6);
  uniqueNumbers.remove(2);
  print(uniqueNumbers); // {1, 3, 4, 5, 6}
}
// Using Maps (Dictionaries)
void main() {
  Map<String, int> scores = {
    "Alice": 90,
    "Bob": 85,
    "Charlie": 88
  };

  scores["David"] = 92; // Add a new key-value pair
  print(scores["Alice"]); // 90
  print(scores.keys); // [Alice, Bob, Charlie, David]
}

//Using Maps (Dictionaries)
void main() {
  Map<String, int> scores = {
    "Alice": 90,
    "Bob": 85,
    "Charlie": 88
  };

  scores["David"] = 92; // Add a new key-value pair
  print(scores["Alice"]); // 90
  print(scores.keys); // [Alice, Bob, Charlie, David]
}

//Stacks & Queues
class Stack<T> {
  List<T> _stack = [];

  void push(T value) => _stack.add(value);
  T pop() => _stack.removeLast();
  bool get isEmpty => _stack.isEmpty;
}

void main() {
  var stack = Stack<int>();
  stack.push(10);
  stack.push(20);
  print(stack.pop()); // 20
}

// Trees & Graphs (DFS & BFS)
class TreeNode {
  int value;
  TreeNode? left, right;

  TreeNode(this.value);
}
//Graph Representation
class Graph {
  Map<int, List<int>> adjList = {};

  void addEdge(int u, int v) {
    adjList.putIfAbsent(u, () => []).add(v);
    adjList.putIfAbsent(v, () => []).add(u);
  }

  void printGraph() {
    adjList.forEach((key, value) {
      print("$key -> $value");
    });
  }
}

void main() {
  var graph = Graph();
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.printGraph();
}

void preOrder(TreeNode? node) {
  if (node == null) return;
  print(node.value);
  preOrder(node.left);
  preOrder(node.right);
}

void main() {
  var root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  
  preOrder(root); // 1, 2, 3
}
//Dynamic Programming (Memoization & Tabulation)
Map<int, int> memo = {};

int fib(int n) {
  if (n <= 1) return n;
  if (memo.containsKey(n)) return memo[n]!;
  return memo[n] = fib(n - 1) + fib(n - 2);
}

void main() {
  print(fib(10)); // 55
}
// URL Shortener (Hashing & Maps)
import 'dart:math';

class URLShortener {
  final Map<String, String> urlMap = {};
  final String base = "https://short.ly/";
  final Random random = Random();

  String generateShortCode() {
    const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return List.generate(6, (_) => chars[random.nextInt(chars.length)]).join();
  }

  String shortenURL(String longURL) {
    String shortCode = generateShortCode();
    urlMap[shortCode] = longURL;
    return base + shortCode;
  }

  String? getOriginalURL(String shortURL) {
    String shortCode = shortURL.replaceAll(base, "");
    return urlMap[shortCode];
  }
}

void main() {
  URLShortener shortener = URLShortener();
  String shortURL = shortener.shortenURL("https://www.example.com/some-long-url");
  print("Short URL: $shortURL");
  print("Original URL: ${shortener.getOriginalURL(shortURL)}");
}
