
class GroceryModel {
  String name;
  double price;
  String description;
  String groceryID;
  String nutritionValue;

  // Constructor
  GroceryModel({
    required this.name,
    required this.price,
    required this.description,
    required this.groceryID,
    required this.nutritionValue,
  });

  // Convert a GroceryModel instance to a Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'groceryID': groceryID,
      'nutritionValue': nutritionValue,
    };
  }

  // Create a GroceryModel instance from a Map (for JSON deserialization)
  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      groceryID: json['groceryID'] ?? '',
      nutritionValue: json['nutritionValue'] ?? '',
    );
  }

  // Optional: Implement a copyWith method for creating modified copies
  GroceryModel copyWith({
    String? name,
    double? price,
    String? description,
    String? groceryID,
    String? nutritionValue,
  }) {
    return GroceryModel(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      groceryID: groceryID ?? this.groceryID,
      nutritionValue: nutritionValue ?? this.nutritionValue,
    );
  }

  // Optional: Override the toString() method for easier debugging
  @override
  String toString() {
    return 'GroceryModel(name: $name, price: $price, description: $description, groceryID: $groceryID, nutritionValue: $nutritionValue)';
  }
}
