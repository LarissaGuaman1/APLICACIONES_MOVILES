import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _entrada = '';
  String _resultado = '0';

  void _presionarBoton(String valor) {
    setState(() {
      if (valor == 'C') {
        _entrada = '';
        _resultado = '0';
      } else if (valor == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_entrada.replaceAll('x', '*'));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _resultado = eval.toString();
        } catch (e) {
          _resultado = 'Error';
        }
      } else {
        _entrada += valor;
      }
    });
  }

  Widget _boton(String texto, {Color? colorFondo, Color? colorTexto}) {
    return ElevatedButton(
      onPressed: () => _presionarBoton(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorFondo ?? Colors.purple.shade300,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorTexto ?? Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 220, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 121, 255),
        title: const Text(
          'Calculadora 💜',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Container(
          width: 320, // ancho fijo
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Pantalla de entrada y resultado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _entrada,
                      style: const TextStyle(fontSize: 24, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Botones
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _boton('7'),
                  _boton('8'),
                  _boton('9'),
                  _boton('/', colorFondo: Colors.purple.shade400),

                  _boton('4'),
                  _boton('5'),
                  _boton('6'),
                  _boton('x', colorFondo: Colors.purple.shade400),

                  _boton('1'),
                  _boton('2'),
                  _boton('3'),
                  _boton('-', colorFondo: Colors.purple.shade400),

                  _boton('C', colorFondo: Colors.purple.shade200, colorTexto: Colors.black),
                  _boton('0'),
                  _boton('=', colorFondo: Colors.deepPurpleAccent),
                  _boton('+', colorFondo: Colors.purple.shade400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
