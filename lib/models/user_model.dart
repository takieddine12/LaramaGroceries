

class UserModel {
  String fullName;
  String email;
  String phone;
  String address;

  // Constructor
  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
  });

  // Convert a UserModel instance to a Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  // Create a UserModel instance from a Map (for JSON deserialization)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }

  // Optionally, you can implement a copyWith method to create modified copies
  UserModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? address,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  // Optional: Override the toString() method for easier debugging
  @override
  String toString() {
    return 'UserModel(fullName: $fullName, email: $email, phone: $phone, address: $address)';
  }
}
