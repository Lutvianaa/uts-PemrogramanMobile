import 'package:flutter/material.dart';
import 'login.dart'; // Import file form.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // Tampilkan halaman dashboard saat pertama kali dijalankan
          LoginPage(), 
    );
  }
}
