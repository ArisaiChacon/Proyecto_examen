import 'package:flutter/material.dart';

class CupcakesScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Vanilla Cupcake',
      'image': 'assets/images/vanilla_cupcake.jpg',
      'description': 'Delicious vanilla cupcake with creamy frosting.',
      'ingredients': 'Flour, sugar, butter, eggs, vanilla extract, milk',
    },
    {
      'name': 'Chocolate Cupcake',
      'image': 'assets/images/chocolate_cupcake.jpg',
      'description': 'Rich chocolate cupcake topped with chocolate ganache.',
      'ingredients': 'Flour, sugar, butter, eggs, cocoa powder, milk',
    },
    {
      'name': 'Red Velvet Cupcake',
      'image': 'assets/images/red_velvet_cupcake.jpg',
      'description': 'Moist red velvet cupcake with cream cheese frosting.',
      'ingredients': 'Flour, sugar, butter, eggs, cocoa powder, buttermilk, vinegar, red food coloring',
    },
    {
      'name': 'Lemon Cupcake',
      'image': 'assets/images/lemon_cupcake.jpg',
      'description': 'Refreshing lemon cupcake with lemon buttercream.',
      'ingredients': 'Flour, sugar, butter, eggs, lemon zest, lemon juice, milk',
    },
    {
      'name': 'Strawberry Cupcake',
      'image': 'assets/images/strawberry_cupcake.jpg',
      'description': 'Moist strawberry cupcake with fresh strawberry frosting.',
      'ingredients': 'Flour, sugar, butter, eggs, strawberries, milk',
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

class ProductDetailScreen extends StatefulWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'Small';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              widget.product['image']!,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              widget.product['name']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              widget.product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredients: ${widget.product['ingredients']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedSize,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSize = newValue!;
                });
              },
              items: <String>['Small', 'Medium', 'Large']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
