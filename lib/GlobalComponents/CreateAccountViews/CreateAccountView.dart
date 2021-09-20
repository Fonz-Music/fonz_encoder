import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

import 'SignInSignUpViews/SignInView.dart';
import 'SignInSignUpViews/SignUpView.dart';

PageController _emailController = PageController(initialPage: 1);

class CreateAccountView extends StatefulWidget {

  CreateAccountView({Key key, this.popupContext, this.notifyParent}) : super(key: key);

  final popupContext;
  final Function() notifyParent;

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
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
//        height: height ,
              child: Center(
                child: Column(
//                    height: height * .5,
//            width: width * .75,
                    children:[
                      // Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 80,
                    width: 40,
                    child: Image(
                      image: AssetImage("assets/fonzIcons/fonzLogoGradiant.png"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: height * .5,
                    // width: width * .72,
                    child:
                      SignInView(popupContext: widget.popupContext,notifyParent: widget.notifyParent,),


                ),
                      Spacer(),
                    ]
                )
              )),
        ],
      ),
    );
  }



}
