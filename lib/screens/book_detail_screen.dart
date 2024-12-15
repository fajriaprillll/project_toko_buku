import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  BookDetailScreen({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('books').doc(bookId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Terjadi kesalahan'));
        }

        var book = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(book['title'])),
          body: Column(
            children: [
              CachedNetworkImage(imageUrl: book['imageUrl']),
              Text(book['title'], style: TextStyle(fontSize: 24)),
              Text(book['author'], style: TextStyle(fontSize: 18)),
              Text('Price: \$${book['price']}'),
              Text(book['description']),
            ],
          ),
        );
      },
    );
  }
}
