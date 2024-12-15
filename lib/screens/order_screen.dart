import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesanan Saya')),
      body: Center(
        child: Text('Tidak ada pesanan saat ini'),
      ),
    );
  }
}
