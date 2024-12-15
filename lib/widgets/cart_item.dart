import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String bookTitle;
  final double price;

  CartItem({required this.bookTitle, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(bookTitle),
      subtitle: Text('\$${price}'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Logic to remove item from cart
        },
      ),
    );
  }
}
