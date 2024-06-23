import 'package:flutter/material.dart';
import 'package:pasteleria_app/screens/login_screen.dart';
import 'package:pasteleria_app/screens/home_screen.dart';
import 'package:pasteleria_app/screens/registro_screen.dart'; // Importa RegistroScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pastelería App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // Ruta inicial
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/registro': (context) => RegistroScreen(), // Ruta para RegistroScreen
      },
    );
  }
}
