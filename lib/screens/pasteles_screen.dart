import 'package:flutter/material.dart';

class PastelesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Pastel de Mocha',
        'image': 'assets/images/pastel_mocha.jpg',
        'description': 'Delicioso pastel de chocolate con crema de mocha.',
      },
      {
        'name': 'Pastel de Fresas',
        'image': 'assets/images/pastel_fresas.jpg',
        'description': 'Pastel suave con capas de crema de fresas frescas.',
      },
      {
        'name': 'Pastel de Tres Leches',
        'image': 'assets/images/pastel_tres_leches.jpg',
        'description': 'Clásico pastel esponjoso empapado en tres tipos de leche.',
      },
      {
        'name': 'Pastel de Zanahoria',
        'image': 'assets/images/pastel_zanahoria.jpg',
        'description': 'Pastel húmedo con trozos de zanahoria y nueces.',
      },
      {
        'name': 'Cheesecake de Frutos Rojos',
        'image': 'assets/images/cheesecake_frutos_rojos.jpg',
        'description': 'Cheesecake cremoso con una capa de frutos rojos frescos.',
      },
      {
        'name': 'Tarta de Manzana',
        'image': 'assets/images/tarta_manzana.jpg',
        'description': 'Tarta clásica de manzana con una cubierta de crujiente de canela.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pasteles'),
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
                  builder: (context) => PastelDetailScreen(product: products[index]),
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

class PastelDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  PastelDetailScreen({required this.product});

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
