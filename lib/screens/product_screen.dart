// import 'package:flutter/material.dart';

// class ProductScreen extends StatelessWidget {
//   final String category;

//   ProductScreen({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     Aquí puedes cargar productos basados en la categoría
//     final List<Map<String, String>> products = [
//       {'name': 'Producto 1', 'image': 'https://via.placeholder.com/150'},
//       {'name': 'Producto 2', 'image': 'https://via.placeholder.com/150'},
//       {'name': 'Producto 3', 'image': 'https://via.placeholder.com/150'},
//       {'name': 'Producto 4', 'image': 'https://via.placeholder.com/150'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Productos de $category'),
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(16.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.network(
//                   products[index]['image']!,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   products[index]['name']!,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
