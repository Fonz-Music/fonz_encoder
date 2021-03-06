import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

class TapYourPhoneBlack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: new Text(
              "tap your phone to the Fonz",
              style: TextStyle(
                fontFamily: FONZFONTTWO,
                fontSize: HEADINGFOUR,
                color: DARKERGREY,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image(
            image: AssetImage("assets/fonzIcons/tapCoasterIconBlack.png"),
          ),
        ],
      ),
    );
  }
}
