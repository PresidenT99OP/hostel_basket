import 'package:flutter/material.dart';
import 'package:hostel_basket/screens/authentication/auth_screen.dart';
import 'package:provider/provider.dart';
import 'modals/UserData.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    print(user);

    return const AuthScreen();
  }
}
