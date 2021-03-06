import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/CoasterInfoPage/InfoPageComponents/CoasterAttributes.dart';
import 'package:fonz_encoder/CoasterInfoPage/InfoPageComponents/ActionButtons.dart';
import 'package:fonz_encoder/HomePage/HomeEncodePage.dart';

class CoasterInfoPage extends StatefulWidget {

  CoasterInfoPage({Key key, this.notifyParent}) : super(key: key);

  // final coasterInfo;
  final Function() notifyParent;

  @override
  _CoasterInfoPageState createState() => _CoasterInfoPageState();
}

class _CoasterInfoPageState extends State<CoasterInfoPage> {

  refresh() async {
    // await userAttributes.setAttributes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final width = size.width;
    final height = size.height;
    return SizedBox(
      height: height * 0.95,
      child: Stack(
        children: [
          Container(
            color: DARKERGREY,
          ),
          Opacity(
            child: SizedBox(
              height: height,
              child:

              Image(
                image: AssetImage("assets/fonzIcons/peoplePartyingBackdrop.jpg"),
                // width: width,
                // height: height * 0.9,
                fit: BoxFit.fill,
                // fit: BoxFit.fitHeight,

                //
              ),
              // Spacer(),

            ),
            opacity: 0.4,
          ),
           // SizedBox(
           //  height: height * 1.5,
           //    child:
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ListView(
                  children: [
                    CoasterActionButtons(notifyParent: refresh,),
                    CoasterAttributesComp(),
                    // Spacer()
                  ],
                ),
              ),
            // )

        ],
      ),
    );
  }



}
