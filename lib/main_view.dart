import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class MainView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainViewState();
}

class MainViewState extends State<MainView> with WidgetsBindingObserver {

  String _nfcId = 'nfc id';
  String _message = 'message';

  NfcData _nfcData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startNFC();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.paused) {
        stopNFC();
      } else if (state == AppLifecycleState.resumed) {
        startNFC();
      }
    });
  }

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

  Future<void> startNFC() async {
    NfcData response;

    setState(() {
      _nfcData = NfcData();
      _nfcData.status = NFCStatus.reading;
    });

    String message = 'Nfc reading failed';

    try {
      response = await FlutterNfcReader.read;
      message = 'Nfc was read successfully';
    } on PlatformException {
      debugPrint('NFC: Scan stopped exception');
    }
    setState(() {
      _nfcData = response;
      updateUi(_nfcData.id, message);
    });
  }

  Future<void> stopNFC() async {
    NfcData response;

    try {
      response = await FlutterNfcReader.stop;
    } on PlatformException {
      debugPrint('NFC: Stop scan exception');
      response = NfcData(
        id: '',
        content: '',
        error: 'NFC scan stop exception',
        statusMapper: '',
      );
      response.status = NFCStatus.error;
    }

    setState(() {
      _nfcData = response;
    });
  }

}

