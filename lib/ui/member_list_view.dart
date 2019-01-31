import 'package:flutter/material.dart';

import 'package:f_max_client/network/api_service.dart';


class MemberListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MemberListViewState();
}

class MemberListViewState extends State<MemberListView> {

  String _hello = 'Hello!';
  String _message = 'message';

  Api _api = Api.get();

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
          ),
          IconButton(
              icon: Icon(Icons.nfc),
              onPressed: () {
                Navigator.of(context).pushNamed('/nfc');
              }
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                _hello,
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