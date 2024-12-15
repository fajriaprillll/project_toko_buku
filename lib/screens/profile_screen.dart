import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Saya')),
      body: Center(
        child: Text('Informasi Profil Pengguna'),
      ),
    );
  }
}
