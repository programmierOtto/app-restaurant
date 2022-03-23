import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int? userid;
  HomeScreen({this.userid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('user with user id ${userid!} logged in'),
      ),
    );
  }
}
