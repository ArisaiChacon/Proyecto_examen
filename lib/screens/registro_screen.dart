import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Primer Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Segundo Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.orange),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
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
              child: Text(
                'Registrarse',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
