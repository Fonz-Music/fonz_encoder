import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/GlobalComponents/CreateAccountViews/CreateAccountView.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/HomePage/SignOutField.dart';

import '../../main.dart';

class SignInHomePage extends StatefulWidget {

  SignInHomePage({Key key, this.notifyParent}) : super(key: key);
  final Function() notifyParent;

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

        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),


        child: MaterialButton(
          child: Container(
            width: width * 0.8,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: SHADOWGREY,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(3, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(CORNERRADIUSBUTTON),
            ),
            child: Center(
              child: Text(
                  "sign in",
                style: TextStyle(
                  fontFamily: FONZFONTTWO,
                  fontSize: HEADINGFIVE,
                  color: DARKERGREY,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // style: NeumorphicStyle(
          //   color: DARKLILAC
          // ),
          onPressed: () async {
            showModalBottomSheet<dynamic>(context: context,
                isScrollControlled: true,
                builder: (BuildContext bc) {
                  return Wrap(
                      children: <Widget>[
                        Container(
                          height: height * 0.95,
                          child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(
                                        25.0),
                                    topRight: const Radius.circular(
                                        25.0))),
                            child: CreateAccountView(notifyParent: widget.notifyParent, popupContext: bc),
                          ),
                        )
                      ]
                  );
                });
          },
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
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (popupContext) {
                  return SignOutField(popupContext: popupContext, notifyParent: widget.notifyParent,);
                }
            );
          },
        ),
      );
    }
  }
}
