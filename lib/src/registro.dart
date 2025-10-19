import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  String? genero = "Femenino";
  String provinciaSeleccionada = "Pichincha";

  final List<String> provincias = [
    "Azuay",
    "Bolívar",
    "Cañar",
    "Carchi",
    "Chimborazo",
    "Cotopaxi",
    "El Oro",
    "Esmeraldas",
    "Galápagos",
    "Guayas",
    "Imbabura",
    "Loja",
    "Los Ríos",
    "Manabí",
    "Morona Santiago",
    "Napo",
    "Orellana",
    "Pastaza",
    "Pichincha",
    "Santa Elena",
    "Santo Domingo de los Tsáchilas",
    "Sucumbíos",
    "Tungurahua",
    "Zamora Chinchipe"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Fondo lila pastel
      appBar: AppBar(
        title: const Text("Registro de Usuario"),
        backgroundColor: const Color(0xFF6A1B9A), // Morado oscuro
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE1BEE7), // Fondo del formulario
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Formulario de Registro",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // N° de control y Cédula
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("N° de control"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("Cédula"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Nombre y Usuario
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("Nombre(s)"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("Usuario"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Apellidos
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("Apellido Paterno"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: _inputDecoration("Apellido Materno"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Contraseña
              TextField(
                obscureText: true,
                decoration: _inputDecoration("Contraseña"),
              ),
              const SizedBox(height: 20),

              // Fecha
              const Text(
                "Fecha de nacimiento:",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: _inputDecoration("Día"),
                      value: 1,
                      items: List.generate(
                        31,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: _inputDecoration("Mes"),
                      value: "Enero",
                      items: [
                        "Enero",
                        "Febrero",
                        "Marzo",
                        "Abril",
                        "Mayo",
                        "Junio",
                        "Julio",
                        "Agosto",
                        "Septiembre",
                        "Octubre",
                        "Noviembre",
                        "Diciembre"
                      ]
                          .map((mes) =>
                              DropdownMenuItem(value: mes, child: Text(mes)))
                          .toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: _inputDecoration("Año"),
                      value: 2000,
                      items: List.generate(
                        80,
                        (index) {
                          int year = 2025 - index;
                          return DropdownMenuItem(
                            value: year,
                            child: Text("$year"),
                          );
                        },
                      ),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Género
              const Text(
                "Género:",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              RadioListTile<String>(
                title: const Text("Femenino"),
                value: "Femenino",
                groupValue: genero,
                onChanged: (value) => setState(() => genero = value),
              ),
              RadioListTile<String>(
                title: const Text("Masculino"),
                value: "Masculino",
                groupValue: genero,
                onChanged: (value) => setState(() => genero = value),
              ),
              RadioListTile<String>(
                title: const Text("Otro"),
                value: "Otro",
                groupValue: genero,
                onChanged: (value) => setState(() => genero = value),
              ),

              const SizedBox(height: 20),

              // Provincia
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Provincia"),
                value: provinciaSeleccionada,
                items: provincias
                    .map((provincia) => DropdownMenuItem(
                          value: provincia,
                          child: Text(provincia),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    provinciaSeleccionada = value!;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E24AA),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Datos guardados correctamente")),
                      );
                    },
                    child: const Text("Guardar",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B9A),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Salir",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
