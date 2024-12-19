import 'dart:math';

class ItemRemoteDataSource {
  Future<List<String>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if (Random().nextBool()) {
      throw Exception("Failed to fetch items"); // Simulate API failure
    }
    return ["Item 1", "Item 2", "Item 3"]; // Simulate API success
  }
}
