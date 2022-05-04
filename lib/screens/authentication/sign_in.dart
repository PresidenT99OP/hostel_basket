import 'package:flutter/material.dart';
import 'package:hostel_basket/services/auth.dart';
import 'package:hostel_basket/shared/loading.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  late String email, password;
  late String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : SafeArea(
            child: Scaffold(
              body: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter valid Email' : null,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.purple,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.length < 6 ? 'Atleast 6 Characters' : null,
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: Colors.purple,
                        ),
                        // prefixIconColor: Colors.purple,
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Enter Valid Email & Password';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: const Text('Sign In'))
                  ],
                ),
              ),
            ),
          );
  }
}
