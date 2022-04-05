import 'package:flutter/material.dart';

class Restaurants extends StatelessWidget {
  var userid;
  var json;

  Restaurants({this.json});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${json!}"),
      ),
    );
  }
}
