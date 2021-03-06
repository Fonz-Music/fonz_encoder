import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/HomePage/HomePageWidgets/scanForCoasterDetails.dart';

import '../HomeEncodePage.dart';

class GetCoasterInfoButton extends StatefulWidget {

  GetCoasterInfoButton({Key key, @required this.notifyParent}) : super(key: key);

  final Function() notifyParent;

  @override
  _GetCoasterInfoButtonState createState() => _GetCoasterInfoButtonState();
}

class _GetCoasterInfoButtonState extends State<GetCoasterInfoButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return SizedBox(
      width: width * .45,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: NeumorphicButton(
                child: Container(
                  width: 100,
                  height: 100,
                  child:
                  Container(
                      padding: const EdgeInsets.all(30),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: LILAC,
                        size: 30,
                      )
                    // child: Image(
                    //   image: AssetImage("assets/fonzIcons/spotifyIconGreen.png"),
                    //
                    // ),
                  ),
                ),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                    border: NeumorphicBorder(width: 2, color: LILAC),
                    color: determineColorThemeBackground(),
                    shadowDarkColor: determineLightShadowRoundButton(),
                    shadowLightColor: determineLightShadowRoundButton()
                ),
                onPressed: () async {
                  encodeTagResponse = "READING_TAG";
                  // widget.notifyParent();

                  commandToLaunch = "GET_COASTER_INFO";
                  var tagUidResp = await scanForTagUid();
                  encodeTagResponse = tagUidResp[0];
                  tagUid = tagUidResp[1];

                  launchedNfcToJoinParty = true;
                  widget.notifyParent();
                  },

              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: new Text(
                "get tag info",
                style: TextStyle(
                  fontFamily: FONZFONTTWO,
                  fontSize: HEADINGFIVE,
                  color: determineColorThemeTextInverse(),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }


}
