import 'package:flutter/material.dart';
import 'menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo de la pantalla
          Image.asset(
            'assets/proyecto_entorno/fondoapp.jpg',
            fit: BoxFit.cover,
          ),

          // Contenido de la pantalla
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón en el centro
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla del menú
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                child: Text('Ir al Menú'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Siguiente'),
      ),
      body: Center(
        child: Text('Esta es la siguiente pantalla.'),
      ),
    );
  }
}
