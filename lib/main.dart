import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Product.dart';

void main() => runApp(const MyApp12());

class MyApp12 extends StatefulWidget {
  const MyApp12({super.key});

  @override
  State<MyApp12> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp12> {
  late Future<List<Product>> products;

  Future<List<Product>> fetchProduct() async {
    final res = await http.get(Uri.parse('http://10.0.2.2:8080/portofolio-maulisa/public/api/product'));
    
    if (res.statusCode == 200) {
      // --- TRIK MEMBERSIHKAN ERROR PHP (AMBIL JSON-NYA SAJA) ---
      String rawData = res.body;
      int startIndex = rawData.indexOf('{'); 
      if (startIndex != -1) {
        rawData = rawData.substring(startIndex); 
      }
      // ---------------------------------------------------------

      var data = jsonDecode(rawData);
      var parsed = data['list'].cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    products = fetchProduct(); // Tarik data saat aplikasi dibuka
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data', style: TextStyle(color: Colors.teal, fontSize: 28)),
                  );
                }
                // Menampilkan data dalam bentuk list
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {}, // Biar ada efek klik
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          margin: const EdgeInsets.only(bottom: 40, left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].name, 
                                style: const TextStyle(color: Colors.blue, fontSize: 28)
                              ),
                              Text(
                                snapshot.data![index].price.toString(), 
                                style: const TextStyle(color: Colors.green, fontSize: 24)
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              // Animasi loading muter-muter saat nunggu data
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}