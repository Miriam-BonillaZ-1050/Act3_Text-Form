import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _stockController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _branchIdController = TextEditingController();

  final List<Map<String, String>> _products = [];

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _stockController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _branchIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Formulario Productos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              fieldName: "ID",
              myController: _idController,
              myIcon: Icons.perm_identity,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "Nombre",
              myController: _nameController,
              myIcon: Icons.text_fields,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "Descripción",
              myController: _descriptionController,
              myIcon: Icons.description,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "Stock",
              myController: _stockController,
              myIcon: Icons.inventory_2,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "Precio",
              myController: _priceController,
              myIcon: Icons.attach_money,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "Categoría",
              myController: _categoryController,
              myIcon: Icons.category,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              fieldName: "ID Sucursal",
              myController: _branchIdController,
              myIcon: Icons.store,
            ),
            const SizedBox(height: 20.0),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        // Agrega el producto a la lista
        setState(() {
          _products.add({
            'name': _nameController.text,
            'description': _descriptionController.text,
          });

          // Limpia los campos (opcional)
          _nameController.clear();
          _descriptionController.clear();
        });

        // Navega a la pantalla de detalles
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(products: _products),
          ),
        );
      },
      child: Text(
        "Enviar".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
