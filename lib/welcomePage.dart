import 'package:v_chat/login.dart';
import 'package:v_chat/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'roundedButton.dart';


class WelcomePage extends StatefulWidget {
  static const String routeName = 'welcomePage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag:'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/logo4.png',
                    ),
                    height: 120.0,
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
              height: 40.0,
            ),
            RoundedButton(title: 'Log In',kolor: Colors.lightBlueAccent,onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },),
            RoundedButton(title: 'Register',kolor: Colors.blueAccent,onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.routeName);
            },),

          ],
        ),
      ),
    );
  }
}

