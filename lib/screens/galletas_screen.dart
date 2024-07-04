import 'package:flutter/material.dart';

class GalletasScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Galleta de Chocolate Blanco y Frambuesa',
      'image': 'assets/images/galleta_choco_blanco.jpg',
      'description': 'Deliciosa galleta de chocolate blanco con trozos de frambuesa.',
    },
    {
      'name': 'Galleta de Limón y Almendra',
      'image': 'assets/images/galleta_limon_almendra.jpg',
      'description': 'Galleta crujiente de limón con trozos de almendra.',
    },
    {
      'name': 'Galleta de Mantequilla con Chispas de Chocolate',
      'image': 'assets/images/galleta_mantequilla_chocolate.jpg',
      'description': 'Clásica galleta de mantequilla con generosas chispas de chocolate.',
    },
    {
      'name': 'Galleta de Avena y Pasas',
      'image': 'assets/images/galleta_avena_pasas.jpg',
      'description': 'Galleta saludable de avena con pasas.',
    },
    {
      'name': 'Galleta de Vainilla con Glaseado',
      'image': 'assets/images/galleta_vainilla_glaseado.jpg',
      'description': 'Suave galleta de vainilla cubierta con un delicioso glaseado.',
    },
    {
      'name': 'Galleta de Coco y Chocolate Negro',
      'image': 'assets/images/galleta_coco_chocolate.jpg',
      'description': 'Galleta con sabor a coco y trozos de chocolate negro.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galletas'),
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
                  builder: (context) => GalletaDetailScreen(product: products[index]),
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

class GalletaDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  GalletaDetailScreen({required this.product});

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
