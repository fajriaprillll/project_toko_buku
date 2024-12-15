import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_toko_buku/models/book.dart';
import 'add_book_screen.dart';  // Import the AddBookScreen
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Buku Online'),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigate to the AddBookScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBookScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Tidak ada buku tersedia.'));
          }

          var books = snapshot.data!.docs;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              // Parse the book document into a Book model using fromMap
              var bookData = books[index].data() as Map<String, dynamic>;
              Book book = Book.fromMap(bookData, books[index].id);

              return BookCard(book: book);
            },
          );
        },
      ),
    );
  }
}
