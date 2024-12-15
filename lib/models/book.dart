class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final double rating;
  final int stock;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.stock,
  });

  // Factory constructor to create a Book from Firestore data
  factory Book.fromMap(Map<String, dynamic> data, String documentId) {
    return Book(
      id: documentId,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      price: (data['price'] is double) ? data['price'] : 0.0,
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      category: data['category'] ?? '',
      rating: (data['rating'] is double) ? data['rating'] : 0.0,
      stock: data['stock'] ?? 0,
    );
  }

  // Convert Book object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
      'stock': stock,
    };
  }
}
