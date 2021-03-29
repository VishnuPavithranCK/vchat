import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:v_chat/chatScreen.dart';
import 'constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginPage';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset(
                          'assets/logo4.png',
                        ),
                        height: 120.0,
                      ),
                    ),
                  ),
                  Container(
                    child: TextLiquidFill(
                      text: 'WECHAT',
                      waveColor: Colors.lightBlueAccent,
                      textStyle: kWelcomePageTitleStyle,
                      boxHeight: 100,
                      boxWidth: 220,
                      boxBackgroundColor: Colors.white,

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter Your Email',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.number,
                decoration: kInputDecoration.copyWith(
                    hintText: 'Password',
                ),
              ),
              RoundedButton(
                  title: 'Log In',
                  kolor: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, ChatScreen.routeName);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }catch(e){
                      print(e);
                    }
    }
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
