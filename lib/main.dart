import 'package:flutter/material.dart';
import 'package:myapp/form.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '3.2 Flutter Push Pop',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}
