import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class Network {
  String? url;
  int? user_id;
  Network({this.url});
  Future getData(String? email, String? password) async {
    var dio = Dio();
    try {
      final response_recieved = await dio.get(
          'http://dasistallesnurge.cloud/user/login?usermail=${email!}&passhash=${password!}');
      print(response_recieved.data);
      if (response_recieved.statusCode == 200) {
        this.user_id = response_recieved.data['userid'];
        return true;
        // print(response.stream.toBytes());
      } else {
        print("ahhhh");
        return false;
      }
    } on DioError catch (e) {
      return false;
    }
  }

  Future postData(String? email, String? password) async {
    var dio = Dio();
    try {
      final response_recieved = await dio.post(
          'http://dasistallesnurge.cloud/user/register?usermail=${email!}&passhash=${password!}');
      print(response_recieved.data);
      if (response_recieved.statusCode == 200) {
        this.user_id = response_recieved.data['userid'];
        return true;
        // print(response.stream.toBytes());
      } else {
        print("ahhhh");
        return false;
      }
    } on DioError catch (e) {
      return false;
    }
  }
}
