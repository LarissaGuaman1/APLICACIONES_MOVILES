import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'calculadora.dart'; // Importa tu pantalla de calculadora

class BotonesScreen extends StatefulWidget {
  const BotonesScreen({super.key});

  @override
  State<BotonesScreen> createState() => _BotonesScreenState();
}

class _BotonesScreenState extends State<BotonesScreen> {
  int _pagina = 0;

  final List<Color> _coloresFondo = [
    const Color.fromARGB(255, 218, 241, 155), // Inicio
    Colors.pink.shade100,                     // Favoritos
    Colors.lightBlue.shade100,                // Buscar
    Colors.green.shade100,                    // Perfil
  ];

  final List<String> _textosPantalla = [
    'Bienvenido a la pantalla de inicio',
    'Favoritos',
    'Buscar',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 155, 245),
        title: const Text(
          'Menú Principal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      backgroundColor: _coloresFondo[_pagina],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: _coloresFondo[_pagina],
        color: const Color.fromARGB(255, 128, 128, 247),
        buttonBackgroundColor: const Color.fromARGB(255, 169, 174, 236),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _pagina = index;
          });
        },
      ),
      body: Center(
        child: _pagina == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _textosPantalla[_pagina],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 165, 121, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalculadoraScreen()),
                      );
                    },
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text(
                      "Ir a Calculadora",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, letterSpacing: 1),
                    ),
                  ),
                ],
              )
            : Text(
                _textosPantalla[_pagina],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
