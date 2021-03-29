import 'package:v_chat/chatScreen.dart';
import 'package:v_chat/login.dart';
import 'package:v_chat/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:v_chat/registrationScreen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chat',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName :(context) =>WelcomePage(),
        LoginScreen.routeName: (context) =>LoginScreen(),
        RegistrationScreen.routeName: (context) =>RegistrationScreen(),
        ChatScreen.routeName: (context)=> ChatScreen(),
      },
    );
  }
}
