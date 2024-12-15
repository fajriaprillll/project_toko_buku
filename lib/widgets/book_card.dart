import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailScreen(bookId: book.id)),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.network(book.imageUrl, fit: BoxFit.cover),
            Text(book.title),
            Text('\$${book.price}'),
          ],
        ),
      ),
    );
  }
}
