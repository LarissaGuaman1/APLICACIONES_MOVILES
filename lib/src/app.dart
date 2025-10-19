import 'package:flutter/material.dart';
import 'botones.dart'; // Pantalla principal después del login
import 'registro.dart'; // Pantalla de registro (Ecuador)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantalla de Login',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget customButton(
      String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0, color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6), // Fondo lila claro
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundColor: Color.fromARGB(255, 169, 10, 150),
                backgroundImage: AssetImage(
                  "/src/flutter/examples/Cuarto/ejemploa/images/gatitos.jpg",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Ejemplo 1",
                style: TextStyle(fontFamily: "NerkoOne", fontSize: 50.0),
              ),
              const Text(
                "Login",
                style: TextStyle(fontFamily: "MedievalSharp", fontSize: 30.0),
              ),
              const SizedBox(height: 30),

              // Campo Usuario
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Usuario:",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Ingresa tu usuario",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Campo Contraseña
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        "Contraseña:",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Ingresa tu contraseña",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Botones Ingresar y Registrarse
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: customButton(
                        "Ingresar",
                        Colors.purpleAccent.shade100,
                        Colors.white,
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Ingresando...")),
                          );
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BotonesScreen()),
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: customButton(
                        "Registrarse",
                        Colors.purple.shade400,
                        Colors.white,
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Redirigiendo al registro...")),
                          );
                          Future.delayed(const Duration(milliseconds: 800), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistroScreen()),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Botón Salir centrado
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Saliendo...")),
                    );
                  },
                  child: const Text(
                    "Salir",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
