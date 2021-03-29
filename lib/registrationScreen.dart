
import 'package:v_chat/chatScreen.dart';
import 'package:v_chat/login.dart';
import 'package:v_chat/roundedButton.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = 'RegistrationPage';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false ;
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
                title: 'Register',
                  kolor: Colors.blueAccent,

                  onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try{
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null){
                    Navigator.pushNamed(context, LoginScreen.routeName);
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
