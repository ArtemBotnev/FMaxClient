import 'package:flutter/material.dart';

import 'package:f_max_client/network/api_service.dart';
import 'package:f_max_client/model/entities.dart';

class MemberDetailView extends StatefulWidget {
  final String memberHref;

  MemberDetailView({@required this.memberHref});

  @override
  State<StatefulWidget> createState() => MemberDetailViewState(memberHref);
}

class MemberDetailViewState extends State<MemberDetailView> {

  String _memberHref;
  List<CheckLists> _checkListsList;
  Api _api = Api.get();

  MemberDetailViewState(String href) {
    this._memberHref = href;
  }

  @override
  void initState() {
    super.initState();

    print(_memberHref);
    _getCheckLists(_memberHref);
  }

  @override
  didPopRoute() {
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Maximo Client'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.nfc),
                onPressed: () {
                  Navigator.of(context).pushNamed('/nfc');
                }
            )
          ],
        ),
        body: _buildCheckListView()
    );
  }

  Widget _buildCheckListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;

          if (_checkListsList != null && index < _checkListsList.length) {
            return _buildRow(_checkListsList[index]);
          }
        }
    );
  }

  Widget _buildRow(CheckLists checkLists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          checkLists.checklistwoid.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        Text(
          checkLists.description,
          style: TextStyle(fontSize: 16.0, color: Colors.teal[900]),
        ),
        Text(
          checkLists.fixed ? 'fixed' : 'not fixed',
          style: TextStyle(fontSize: 16.0, color: Colors.deepPurple),
        )
      ],
    );
  }

  void _getCheckLists(String href) {
    var futureMemberDetail = _api.getCheckLists(href);

    futureMemberDetail.then((d) {
      print(d.wonum);
      setState(() {
        _checkListsList = d.checkLists;
      });
    }).catchError((e) => print(e));
  }

}