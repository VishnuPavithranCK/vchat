import 'package:flutter/material.dart';
import 'constants.dart';



class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.onPressed,this.title,this.kolor});
  final Color kolor;
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: kolor,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title,style: kButtonTextStyle,),
        ),
      ),
    );
  }
}
