import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String category;

  ProductScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de $category'),
      ),
      body: Center(
        child: Text('Lista de productos para la categoría $category'),
      ),
    );
  }
}
