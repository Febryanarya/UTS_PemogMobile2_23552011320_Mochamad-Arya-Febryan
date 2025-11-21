import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart_cubit.dart';
import 'pages/cart_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App UTS",
        theme: ThemeData(
          useMaterial3: true,              // Wajib untuk Badge Material 3
          colorSchemeSeed: Colors.blue,    // Warna tema aplikasi
          brightness: Brightness.light,
        ),
        home: const CartHomePage(),
      ),
    );
  }
}
