import 'package:aplikasi/presentation/page/first_page.dart';
import 'package:aplikasi/presentation/page/second_page.dart';
import 'package:aplikasi/presentation/page/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Ahmad Zaini',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => first_page(),
        '/second_page': (context) => second_page(name: ModalRoute.of(context)!.settings.arguments as String),
        '/third_page': (context) => third_page(),
      },
    );
  }
}
