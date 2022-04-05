import 'package:app_restaurant/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:app_restaurant/home_screen.dart';
import './constants.dart';
import './services/network.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  String? username;
  String? password;

  void onTap() async {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      print(username);
      print(password);
      Network networkHelper = Network();
      var response = await networkHelper.getData(username, password);

      if (response) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(userid: networkHelper.user_id)));
      } else {
        print('oops');
        final snackBar = SnackBar(content: Text('incorect pasword'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  void onTapReg() async {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      print(username);
      print(password);
      Network networkHelper = Network();
      var response = await networkHelper.postData(username, password);

      if (response) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(userid: networkHelper.user_id)));
      } else {
        print('oops');
        final snackBar = SnackBar(content: Text('mail already registered'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  void showRestaurants() async {
    Network networkHelper = Network();
    var response = await networkHelper.getRestaurants();

    if (response) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Restaurants(json: networkHelper.json)));
    } else {
      print('oops');
      final snackBar = SnackBar(content: Text('mail already registered'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: kFormText,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: kInputDecoration.copyWith(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email is empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: kInputDecoration.copyWith(
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: kFormText.copyWith(color: Color(0xFFF19D38)),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  print('useer tapped');
                  showRestaurants();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF19D38)),
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'ShowRestaurants',
                    textAlign: TextAlign.center,
                    style: kFormText,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  print('useer tapped');
                  onTap();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF19D38)),
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: kFormText,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  print('useer tapped');
                  onTapReg();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF19D38)),
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: kFormText,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
