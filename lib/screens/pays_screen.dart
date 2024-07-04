import 'package:flutter/material.dart';

class PaysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Pay de Manzana',
        'image': 'assets/images/pay_manzana.jpg',
        'description': 'Pay clásico de manzana con una cubierta de crujiente.',
      },
      {
        'name': 'Pay de Limón',
        'image': 'assets/images/pay_limon.jpg',
        'description': 'Pay refrescante de limón con una capa de merengue.',
      },
      {
        'name': 'Pay de Queso',
        'image': 'assets/images/pay_queso.jpg',
        'description': 'Pay cremoso de queso con una base de galleta.',
      },
      {
        'name': 'Pay de Durazno',
        'image': 'assets/images/pay_durazno.jpg',
        'description': 'Pay dulce de durazno con un toque de canela.',
      },
      {
        'name': 'Pay de Chocolate',
        'image': 'assets/images/pay_chocolate.jpg',
        'description': 'Pay indulgente de chocolate con una base de galleta oreo.',
      },
      {
        'name': 'Pay de Cereza',
        'image': 'assets/images/pay_cereza.jpg',
        'description': 'Pay delicioso de cereza con una cubierta de crema batida.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pays'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayDetailScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    products[index]['image']!,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    products[index]['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PayDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  PayDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product['image']!,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para agregar al carrito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['name']} agregado al carrito'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
