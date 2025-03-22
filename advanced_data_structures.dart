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
 // Rate Limiter (Queue & Time Management)
import 'dart:collection';
import 'dart:async';

class RateLimiter {
  final int limit;
  final Duration window;
  final Map<String, Queue<DateTime>> userRequests = {};

  RateLimiter(this.limit, this.window);

  bool allowRequest(String userID) {
    DateTime now = DateTime.now();
    userRequests.putIfAbsent(userID, () => Queue<DateTime>());
    
    Queue<DateTime> timestamps = userRequests[userID]!;
    while (timestamps.isNotEmpty && now.difference(timestamps.first) > window) {
      timestamps.removeFirst();
    }
    
    if (timestamps.length < limit) {
      timestamps.add(now);
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  RateLimiter limiter = RateLimiter(5, Duration(seconds: 10));
  
  for (int i = 0; i < 7; i++) {
    bool allowed = limiter.allowRequest("user123");
    print("Request ${i + 1}: ${allowed ? "Allowed" : "Blocked"}");
    sleep(Duration(seconds: 2));
  }
}

// Autocomplete Search (Trie)
class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class AutoComplete {
  final TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (var char in word.split("")) {
      node.children.putIfAbsent(char, () => TrieNode());
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  List<String> search(String prefix) {
    TrieNode? node = root;
    for (var char in prefix.split("")) {
      if (!node!.children.containsKey(char)) return [];
      node = node.children[char];
    }
    return _getWordsFromNode(node!, prefix);
  }

  List<String> _getWordsFromNode(TrieNode node, String prefix) {
    List<String> words = [];
    if (node.isEndOfWord) words.add(prefix);
    for (var entry in node.children.entries) {
      words.addAll(_getWordsFromNode(entry.value, prefix + entry.key));
    }
    return words;
  }
}

void main() {
  AutoComplete autoComplete = AutoComplete();
  autoComplete.insert("apple");
  autoComplete.insert("app");
  autoComplete.insert("apricot");
  autoComplete.insert("banana");

  print(autoComplete.search("ap")); // Output: ["apple", "app", "apricot"]
}

// Stock Price Prediction (Sliding Window)
List<int> maxStockPrices(List<int> prices, int k) {
  List<int> result = [];
  for (int i = 0; i <= prices.length - k; i++) {
    result.add(prices.sublist(i, i + k).reduce((a, b) => a > b ? a : b));
  }
  return result;
}

void main() {
  List<int> prices = [1, 3, 2, 5, 8, 7, 10];
  print(maxStockPrices(prices, 3)); // Output: [3, 5, 8, 8, 10]
}

// Flight Ticket Price Tracker (Heap/Priority Queue)
import 'dart:collection';

class FlightTracker {
  final PriorityQueue<int> minHeap;
  final int k;

  FlightTracker(this.k) : minHeap = PriorityQueue<int>((a, b) => a.compareTo(b));

  void addPrice(int price) {
    minHeap.add(price);
    if (minHeap.length > k) {
      minHeap.removeLast();
    }
  }

  List<int> getCheapestFlights() {
    return minHeap.toList();
  }
}

void main() {
  FlightTracker tracker = FlightTracker(3);
  tracker.addPrice(400);
  tracker.addPrice(200);
  tracker.addPrice(350);
  tracker.addPrice(100);
  tracker.addPrice(150);

  print(tracker.getCheapestFlights()); // Output: [100, 150, 200]
}
