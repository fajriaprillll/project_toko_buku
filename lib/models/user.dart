class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final List<String> cart;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.cart,
  });

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      name: data['name'],
      email: data['email'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
      cart: List<String>.from(data['cart'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'cart': cart,
    };
  }
}
