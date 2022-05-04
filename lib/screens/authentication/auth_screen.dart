import 'package:flutter/material.dart';
import 'package:hostel_basket/modals/UserData.dart';
import 'package:hostel_basket/screens/home_screen/homepage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate

    if (UserData == null) {
      return AuthScreen();
    } else {
      return HomePage();
    }
    // return SigninScreen();
  }
}
