import 'package:cloud_firestore/cloud_firestore.dart';

import 'book.dart';

class Order {
  final String id;
  final String userId;
  final DateTime orderDate;
  final List<Book> books;
  final double totalAmount;
  final String status;

  Order({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.books,
    required this.totalAmount,
    required this.status,
  });

  factory Order.fromMap(Map<String, dynamic> data, String documentId) {
    var books = (data['books'] as List).map((bookData) => Book.fromMap(bookData, bookData['id'])).toList();
    return Order(
      id: documentId,
      userId: data['userId'],
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      books: books,
      totalAmount: data['totalAmount'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'orderDate': orderDate,
      'books': books.map((book) => book.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status,
    };
  }
}
