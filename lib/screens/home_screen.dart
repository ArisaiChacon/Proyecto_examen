import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Importación directa sin "screens/"
import 'profile_screen.dart'; // Importación directa sin "screens/"
import 'product_screen.dart'; // Importación directa sin "screens/"

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Pasteles', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGob6EWEa_szhEivIquEemsLt-ejMRvxrtmg&s'},
    {'name': 'Cupcakes', 'image': 'https://www.goya.com/media/7397/coquito-cupcakes.jpg?quality=80'},
    {'name': 'Galletas', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8_g2bSzgQCiPScikFCfb3EmkGPPtun_8NKg&s'},
    {'name': 'Pays', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-QnkpNa8-PuPOvsMTG9TFF8H68kH3wp2D8Q&s'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pastelería: Sabor y arte'),
    // Color de fondo del AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                    borderSide: BorderSide(color: Colors.orange), // Color del borde
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.orange), // Color del ícono del prefijo
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Bordes redondeados cuando está enfocado
                    borderSide: BorderSide(color: Colors.orange), // Color del borde cuando está enfocado
                  ),
                ),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqAsrnHtegIGYPBNQ2qhoHyVq5e2Z3J1vsGw&s',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(category: categories[index]['name']!),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            categories[index]['image']!,
                            height: 150, // Aumento del tamaño de la imagen
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
              SizedBox(height: 16),
              Text(
                'Explora nuestras deliciosas opciones:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.network(
                        'https://lh5.googleusercontent.com/p/AF1QipPKvE8QWzjNtqX5EuX_uVuKFxTdrnbUkTPIajmE',
                        height: 200, // Aumento del tamaño de la imagen
                        width: 200, // Aumento del tamaño de la imagen
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Pastelería A',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ubicación A',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://lh5.googleusercontent.com/p/AF1QipPKvE8QWzjNtqX5EuX_uVuKFxTdrnbUkTPIajmE',
                        height: 200, // Aumento del tamaño de la imagen
                        width: 200, // Aumento del tamaño de la imagen
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Pastelería B',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ubicación B',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
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
        selectedItemColor: Color.fromARGB(255, 236, 102, 6), // Color naranja cuando está seleccionado
        unselectedItemColor: Colors.black, // Color negro o café cuando no está seleccionado
        onTap: (int index) {
          switch (index) {
            case 0:
              // Inicio (ya estamos en la página principal)
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
            case 3:
              // Navegar a la página de compras o realizar otra acción
              break;
            default:
          }
        },
      ),
    );
  }
}
