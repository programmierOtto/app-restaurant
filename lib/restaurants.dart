import 'dart:convert';

import 'package:flutter/material.dart';

class Restaurants extends StatelessWidget {
  var userid;
  var json;

  Restaurants({this.json});
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = jsonDecode(json); // import 'dart:convert';
    var _list = map.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: Container(
        child: Column(
          children: [for (var i in _list) Text(i["Telefon"])],
        ),
      ),
    );
  }
}
