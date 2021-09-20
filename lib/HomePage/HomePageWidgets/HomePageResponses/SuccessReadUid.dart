import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

class SuccessReadUid extends StatefulWidget {



  @override
  _SuccessReadUidState createState() => _SuccessReadUidState();
}

class _SuccessReadUidState extends State<SuccessReadUid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: NeumorphicButton(
              child: Container(
                width: 150,
                height: 150,
                child:
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.check,
                    color: SUCCESSGREEN,
                    size: 50
                  )
                ),
              ),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  border: NeumorphicBorder(width: 2, color: SUCCESSGREEN),
                  color: determineColorThemeBackground(),
                  shadowDarkColor: determineLightShadowRoundButton(),
                  shadowLightColor: determineLightShadowRoundButton()
              ),
            ),
          ),
          Container(
            color: DARKERGREY,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: new Text(
              "successfully read tag uid",
              style: TextStyle(
                fontFamily: FONZFONTTWO,
                fontSize: HEADINGFOUR,
                color: SUCCESSGREEN,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
