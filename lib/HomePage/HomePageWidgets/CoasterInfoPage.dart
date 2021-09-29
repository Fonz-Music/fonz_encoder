import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

class CoasterInfoPage extends StatefulWidget {

  CoasterInfoPage({Key key, this.coasterInfo, this.notifyParent}) : super(key: key);

  final coasterInfo;
  final Function() notifyParent;

  @override
  _CoasterInfoPageState createState() => _CoasterInfoPageState();
}

class _CoasterInfoPageState extends State<CoasterInfoPage> {
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
          Container(
            // height: height * .9,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "tagUID: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].coaster.coasterId}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "group: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].coaster.group}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "encoded: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].coaster.encoded.toString()}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "userId: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                      ],
                    ),
                    Text(
                      "${widget.coasterInfo["body"].coaster.userId}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),

                Row(
                  children: [
                    Text(
                      "coasterName: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].coaster.name}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "hostName: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].hostName}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "sessionId: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                      ],
                    ),
                    Text(
                      "${widget.coasterInfo["body"].session.sessionId}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),

                Row(
                  children: [
                    Text(
                      "provider: ",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Text(
                      "${widget.coasterInfo["body"].session.provider}",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFOUR,
                        color: LILAC,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Spacer()
              ],
            )
          ),
        ],
      ),
    );
  }
}
