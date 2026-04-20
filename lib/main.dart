import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Pertama Flutter'),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nama: Annasya Maulafidatu Zahra',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                'NIM: 2311102246',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}