
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(title: const Text('Rappi-Repartidores-Carlos 6I'),
        backgroundColor: const Color.fromARGB(255, 206, 72, 23),
        ),
        body: const ListaPersonalizada(),
      ),
    );
  }
}

class ListaPersonalizada extends StatelessWidget {
  const ListaPersonalizada({super.key});

  // Datos de ejemplo
  final List<Map<String, String>> usuarios = const [
    {'nombre': 'Alice Johnson', 'user': '@alice_rappi', 'img': 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p1.jfif'},
    {'nombre': 'Jenna Smith', 'user': '@jenna_rappi', 'img': 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p2.jfif'},
    {'nombre': 'Raul Gomez', 'user': '@raul_rappi', 'img': 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p3.jfif'},
    {'nombre': 'Roberto', 'user': '@roberto_rappi', 'img': 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p4.jfif'},
    {'nombre': 'Maria Wilson', 'user': '@Maria_raapi', 'img': 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p5.jfif'},
  ];

  // Lista de colores llamativos
  final List<Color> colores = const [
    Color(0xFFFFADAD), Color(0xFFFFD6A5), Color(0xFFFDFFB6), 
    Color(0xFFCAFFBF), Color(0xFF9BF6FF), Color(0xFFA0C4FF), 
    Color(0xFFBDB2FF), Color(0xFFFFC6FF),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        final usuario = usuarios[index];
        
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(12),
          // --- Estilo de la Fila (Redondeado y Sombra) ---
          decoration: BoxDecoration(
            color: colores[index % colores.length], // Asigna un color diferente
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: const Offset(0, 5), // Sombra hacia abajo
              ),
            ],
          ),
          child: Row(
            children: [
              // --- Imagen desde la red circular ---
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  usuario['img']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15), // Espaciado
              // --- Textos (Nombre y Usuario) ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usuario['nombre']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Texto negro
                    ),
                  ),
                  Text(
                    usuario['user']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87, // Texto negro algo más suave
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}