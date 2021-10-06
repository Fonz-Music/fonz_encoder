import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';

class CoasterActionButtons extends StatefulWidget {
  CoasterActionButtons({Key key, this.coasterInfo}) : super(key: key);

  final coasterInfo;

  @override
  _CoasterActionButtonsState createState() => _CoasterActionButtonsState();
}

class _CoasterActionButtonsState extends State<CoasterActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
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
            onPressed: () {
              // launch change group name
            },
          )
        ],
      ),
    );
  }
}
