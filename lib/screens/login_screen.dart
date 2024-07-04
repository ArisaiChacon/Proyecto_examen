import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.brown, // Color de fondo café
                child: Text(
                  'Logo',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 350, // Ancho fijo para los campos de entrada
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.brown), // Borde café
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.brown), // Icono café
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.brown), // Borde café enfocado
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 350, // Ancho fijo para los campos de entrada
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.brown), // Borde café
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.brown), // Icono café
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.brown), // Borde café enfocado
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 250, // Ancho fijo para el botón
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home'); // Navegar al HomeScreen
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Color de fondo café
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Texto blanco
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el botón de Facebook
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Color de fondo café
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.white), // Icono de Facebook blanco
                      SizedBox(width: 8),
                      Text('Facebook', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el botón de Google
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Color de fondo café
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.g_mobiledata, color: Colors.white), // Icono de Google blanco
                      SizedBox(width: 8),
                      Text('Google', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: Text('Registrarse', style: TextStyle(color: Colors.brown)), // Texto café
            ),
          ],
        ),
      ),
    );
  }
}
