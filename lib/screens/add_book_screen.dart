import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_toko_buku/models/book.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  String _description = '';
  double _price = 0.0;
  String _imageUrl = '';
  String _category = '';
  double _rating = 0.0;
  int _stock = 0;

  // Fungsi untuk menambahkan buku ke Firestore
  Future<void> _addBook() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final newBook = Book(
        id: '', // Firestore will generate the ID automatically
        title: _title,
        author: _author,
        description: _description,
        price: _price,
        imageUrl: _imageUrl,
        category: _category,
        rating: _rating, // You can use a default rating (e.g., 0.0)
        stock: _stock, // You can use a default stock (e.g., 0)
      );

      // Menyimpan data buku ke Firestore
      try {
        await FirebaseFirestore.instance.collection('books').add(newBook.toMap());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buku berhasil ditambahkan')));
        Navigator.pop(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menambahkan buku')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Buku Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Judul Buku'),
                onSaved: (value) => _title = value!,
                validator: (value) => value!.isEmpty ? 'Judul buku tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Penulis'),
                onSaved: (value) => _author = value!,
                validator: (value) => value!.isEmpty ? 'Nama penulis tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Deskripsi'),
                onSaved: (value) => _description = value!,
                validator: (value) => value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _price = double.tryParse(value!) ?? 0.0,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  } else if (double.tryParse(value) == null) {
                    return 'Masukkan harga yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kategori'),
                onSaved: (value) => _category = value!,
                validator: (value) => value!.isEmpty ? 'Kategori tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _rating = double.tryParse(value!) ?? 0.0,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Rating tidak boleh kosong';
                  } else if (double.tryParse(value) == null) {
                    return 'Masukkan rating yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Stok'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _stock = int.tryParse(value!) ?? 0,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Stok tidak boleh kosong';
                  } else if (int.tryParse(value) == null) {
                    return 'Masukkan stok yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Upload Gambar Buku'),
                onSaved: (value) => _imageUrl = value!,
                validator: (value) => value!.isEmpty ? 'gambar tidak boleh kosong' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addBook,
                child: Text('Tambah Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
