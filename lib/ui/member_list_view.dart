import 'package:flutter/material.dart';

import 'package:f_max_client/network/api_service.dart';
import 'package:f_max_client/model/entities.dart';
import 'package:f_max_client/main.dart';
import 'package:f_max_client/ui/member_detail_view.dart';

class MemberListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MemberListViewState();
}

class MemberListViewState extends State<MemberListView> {

  List<Member> _members;

  Api _api = Api.get();

  @override
  void initState() {
    super.initState();
    _getInfo();
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
                Navigator.of(context).pushNamed(FMaxApp.NFC_VIEW);
              }
          )
        ],
      ),
      body: _buildMemberListView()
    );
  }

  Widget _buildMemberListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;

        if (_members != null && index < _members.length) {
          return _buildRow(_members[index]);
        }
      }
    );
  }

  Widget _buildRow(Member member) {
    return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              member.wonum,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              member.description,
              style: TextStyle(fontSize: 16.0, color: Colors.teal[900]),
            )
          ],
        ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MemberDetailView(memberHref: member.href)
          )
      )
    );
  }


  void _getInfo() {
    var futureInfo = _api.info(
        '1',
        'description,worktype,wonum,targstartdate,targcompdate',
        'worktype in ["ФНА","ФМА"] and status in ["СФОРМИРОВАНО"] and siteid="ГК"'
    );

    futureInfo.then((info) {
      print(info.member[0].wonum);
        setState(() {
          _members = info.member;
        }
      );
    }).catchError((e) => print(e));
  }

}