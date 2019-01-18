import 'package:flutter/material.dart';

class MainView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainViewState();
}

class MainViewState extends State<MainView> {

  String _nfcId = 'body';
  String _message = 'bottom';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Maximo Client'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                _nfcId,
                style: const TextStyle(color: Colors.black, fontSize: 22.0),
              ),
              alignment: Alignment(0.0, 0.0),
            ),
            flex: 7,
          ),
          Expanded(
            child: Container(
              child: Text(
                _message,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 20.0),
              ),
              alignment: Alignment(0.0, 0.0),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  void updateUi(String nfcId, String message) {
    _nfcId = nfcId;
    _message = message;
  }

}