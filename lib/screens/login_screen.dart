import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://lh5.googleusercontent.com/p/AF1QipPKvE8QWzjNtqX5EuX_uVuKFxTdrnbUkTPIajmE'),
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
                  ),
                  prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 236, 102, 6)),
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
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 220, 115, 45)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 250, // Ancho fijo para el botón
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
