import 'package:admin_jewellery_app/src/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class AdminJewelleryApp extends StatelessWidget {
  const AdminJewelleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const ProductScreen(),
    );
  }
}