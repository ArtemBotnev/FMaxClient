import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import 'package:f_max_client/network/api_service.dart';

class MainView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainViewState();
}

class MainViewState extends State<MainView> with WidgetsBindingObserver {

  String _nfcId = 'nfc id';
  String _message = 'message';

  NfcData _nfcData;

  Api _api = Api.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startNFC();
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
        _stopNFC();
      } else if (state == AppLifecycleState.resumed) {
        _startNFC();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Maximo Client'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              _getInfo();
            },
          )
        ],
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

  void _updateUi(String nfcId, String message) {
    _nfcId = nfcId;
    _message = message;
  }

  Future<void> _startNFC() async {
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
      _updateUi(_nfcData.id, message);
    });
  }

  Future<void> _stopNFC() async {
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

  void _getInfo() {
    var futureInfo = _api.info(
      1,
      'description,worktype,wonum,targstartdate,targcompdate',
      'worktype in ["ФНА","ФМА"] and status in ["СФОРМИРОВАНО"] and siteid="ГК"'
    );
    
    futureInfo.then((info) => print(info.member[0].href))
      .catchError((e) => print(e));
  }  

}

