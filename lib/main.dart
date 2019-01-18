import 'package:flutter/material.dart';
import 'package:f_max_client/main_view.dart';

void main() => runApp(FMaxApp());

class FMaxApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maximo Client',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.amber,
        iconTheme: IconThemeData.fallback()
      ),
      home: MainView(),
    );
  }
}


