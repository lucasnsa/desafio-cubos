import 'package:flutter/material.dart';

void main() {
  runApp(const EmptyApp());
}

class EmptyApp extends StatelessWidget {
  const EmptyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Cubos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmptyPage(),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Empty Page'),
    );
  }
}
