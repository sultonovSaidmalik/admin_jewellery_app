import 'package:admin_jewellery_app/src/common/repository/product_repository/product_repository.dart';
import 'package:admin_jewellery_app/src/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/screens/bloc/product_bloc/product_bloc.dart';

class AdminJewelleryApp extends StatelessWidget {
  const AdminJewelleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(repository: ProductRepository())..add(const ProductGetDataEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        home: const ProductScreen(),
      ),
    );
  }
}