import 'package:flutter/material.dart';
import 'package:f_max_client/ui/nfc_view.dart';
import 'package:f_max_client/ui/member_list_view.dart';

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
      home: MemberListView(),
      routes: <String, WidgetBuilder> {
        '/nfc': (BuildContext context) => NfcView()
      },
    );
  }
}


