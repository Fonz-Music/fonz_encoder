import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

import '../../main.dart';

class SignInHomePage extends StatefulWidget {
  @override
  _SignInHomePageState createState() => _SignInHomePageState();
}

class _SignInHomePageState extends State<SignInHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    if (!userSignedIn) {
      return Container(
        width: width * 0.8,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: NeumorphicButton(
          child: Text(
              "sign in",
            style: TextStyle(
              fontFamily: FONZFONTTWO,
              fontSize: HEADINGFIVE,
              color: DARKERGREY,
            ),
            textAlign: TextAlign.center,
          ),
          style: NeumorphicStyle(
            color: DARKLILAC
          ),
        ),
      );
    }
    else {
      return Container(
        width: width * 0.8,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: NeumorphicButton(
          child: Text(
            "sign out",
            style: TextStyle(
              fontFamily: FONZFONTTWO,
              fontSize: HEADINGFIVE,
              color: DARKERGREY,
            ),
            textAlign: TextAlign.center,
          ),
          style: NeumorphicStyle(
              color: DARKLILAC
          ),
        ),
      );
    }
  }
}
