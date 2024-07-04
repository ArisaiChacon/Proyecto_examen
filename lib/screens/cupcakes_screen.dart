import 'package:flutter/material.dart';

class CupcakesScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Vanilla Cupcake',
      'image': 'assets/images/cupcake1.jpg',
      'description': 'Delicious vanilla cupcake with creamy frosting.',
    },
    {
      'name': 'Chocolate Cupcake',
      'image': 'assets/images/cupcake2.jpg',
      'description': 'Rich chocolate cupcake topped with chocolate ganache.',
    },
    {
      'name': 'Red Velvet Cupcake',
      'image': 'assets/images/cupcake3.jpg',
      'description': 'Moist red velvet cupcake with cream cheese frosting.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupcakes'),
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
                  builder: (context) => ProductDetailScreen(product: products[index]),
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

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

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
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), 
      minimumSize: MaterialStateProperty.all<Size>(Size(120, 32)), 
    ),
    child: Text(
      'Agregar al carrito',
      style: TextStyle(
        fontSize: 14, 
        color: Colors.white, 
      ),
    ),
  ),

          ],
        ),
      ),
    );
  }
}
