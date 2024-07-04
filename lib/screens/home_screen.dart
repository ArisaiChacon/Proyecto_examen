import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'pasteles_screen.dart';
import 'cupcakes_screen.dart';
import 'galletas_screen.dart';
import 'pays_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Pasteles', 'image': 'assets/images/pasteles.jpg'},
    {'name': 'Cupcakes', 'image': 'assets/images/cupcakes.jpg'},
    {'name': 'Galletas', 'image': 'assets/images/galletas.jpg'},
    {'name': 'Pays', 'image': 'assets/images/pays.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0), // Ajustar la altura según sea necesario
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown, // Color café para el recuadro
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pastelería: Sabor y arte', // Título de la pastelería
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: TextStyle(color: Colors.white), // Color café para el texto de sugerencia
                        prefixIcon: Icon(Icons.search, color: Colors.white), // Icono de búsqueda blanco
                        filled: true,
                        fillColor: Colors.brown.shade400, // Color del fondo del TextField
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.white), // Bordes visibles al enfocar
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Color del texto dentro del TextField
                    ),
                  ),
                  SizedBox(width: 8.0), // Espacio entre el TextField y el icono del carrito
                  GestureDetector(
                    onTap: () {
                      // Acción al presionar el icono del carrito
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    child: Icon(Icons.shopping_cart, color: Colors.white), // Icono de carrito blanco
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Image.asset(
                'assets/images/pasteles.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                'Categorías',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PastelesScreen()),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CupcakesScreen()),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GalletasScreen()),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaysScreen()),
                          );
                          break;
                      }
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index]['image']!,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            categories[index]['name']!,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Compras',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.brown, // Color café para el ícono seleccionado
        unselectedItemColor: Colors.black, // Color café para el ícono no seleccionado
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
            case 3:
             
              break;
            default:
          }
        },
      ),
    );
  }
}
