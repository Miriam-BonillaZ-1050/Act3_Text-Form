import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.products,
  });

  final List<Map<String, String>> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalles de Productos"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, color: Colors.grey.shade300),
            ),
            leading: const Icon(Icons.bookmark_added_rounded, color: Colors.blueAccent),
            title: Text(
              product['name'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            subtitle: Text(product['description'] ?? ''),
            trailing: const Icon(Icons.delete, color: Colors.grey),
          );
        },
      ),
    );
  }
}
