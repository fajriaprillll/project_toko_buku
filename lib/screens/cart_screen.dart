import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang Belanja')),
      body: Center(
        child: Text('Keranjang Belanja Kosong'),
      ),
    );
  }
}
