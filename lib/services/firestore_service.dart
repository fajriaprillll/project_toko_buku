import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Book>> getBooks() async {
    var snapshot = await _db.collection('books').get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addBook(Book book) async {
    await _db.collection('books').add(book.toMap());
  }
}
