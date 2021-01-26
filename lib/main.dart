import 'package:flutter/material.dart';
import 'telas/tela_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TelaLoading(),
    );
  }
}
