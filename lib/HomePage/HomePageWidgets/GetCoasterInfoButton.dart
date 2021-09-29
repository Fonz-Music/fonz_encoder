import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

class GetCoasterInfoButton extends StatefulWidget {

  // BuyACoasterHomeButton({Key key, @required this.notifyParent}) : super(key: key);



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
                  width: 50,
                  height: 50,
                  child:
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: LILAC,
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

                  },

              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: new Text(
                "get coaster info",
                style: TextStyle(
                  fontFamily: FONZFONTTWO,
                  fontSize: HEADINGSIX,
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
