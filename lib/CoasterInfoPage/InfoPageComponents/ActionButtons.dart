import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fonz_encoder/ApiFunctions/AdminWebApi.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/CoasterInfoPage/InfoPageComponents/ButtonFields/ChangeGroupField.dart';
import 'package:fonz_encoder/HomePage/HomeEncodePage.dart';
import 'package:fonz_encoder/HomePage/HomePageWidgets/scanForCoasterDetails.dart';

class CoasterActionButtons extends StatefulWidget {
  CoasterActionButtons({Key key, this.notifyParent}) : super(key: key);
  //
  final Function() notifyParent;
  // final coasterInfo;

  @override
  _CoasterActionButtonsState createState() => _CoasterActionButtonsState();
}

class _CoasterActionButtonsState extends State<CoasterActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              MaterialButton(

                child: Container(
                  height: 70,
                  width: 100,
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text(
                      "change group",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFIVE,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () async {
                  // launch change group name
                  await showDialog(
                      context: context,
                      builder: (popupContext) {
                        return ChangeGroupField(coasterUid: tagInfo.coaster.coasterId, popupContext: popupContext, notifyParent: widget.notifyParent,);
                      }
                  );
                  // widget.notifyParent();
                },
              ),
              MaterialButton(

                child: Container(
                  height: 70,
                  width: 100,
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text(
                      "encode coaster",
                      style: TextStyle(
                        fontFamily: FONZFONTTWO,
                        fontSize: HEADINGFIVE,
                        color: determineColorThemeTextInverse(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () async {
                  // launch change group name
                  await writeFonzUrlToCoaster(tagInfo.coaster.coasterId);
                  // widget.notifyParent();
                },
              ),
                            Spacer()
            ],
          ),
          Container(height: 15,),
          DetermineIfReleaseCoasterShows(tagInfo.user.displayName, tagInfo.coaster.coasterId),

        ],
      ),
    );
  }
}

Widget DetermineIfReleaseCoasterShows(String hostName, String tagUid) {
  // if has host
  log("hostname is " + hostName);
  if (hostName != null && hostName != "") {
    return MaterialButton(

      child: Container(
        height: 70,
        width: 100,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Center(
          child: Text(
            "disconnect host",
            style: TextStyle(
              fontFamily: FONZFONTTWO,
              fontSize: HEADINGFIVE,
              color: determineColorThemeTextInverse(),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: () async {
        // launch change group name
        var coasterInfo = await AdminWebApi.releaseTagFromHost(tagUid);
        // widget.notifyParent();
      },
    );
  }
  else {
    return Container(width: 0,);
  }
}
