import 'dart:developer';
import 'package:flutter/services.dart';
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


                TagInfoContent("tagUID", widget.coasterInfo["body"].coaster.coasterId),
                TagInfoContent("encoded", widget.coasterInfo["body"].coaster.encoded.toString()),
                TagInfoContent("group", widget.coasterInfo["body"].coaster.group),
                TagInfoContent("userId", widget.coasterInfo["body"].coaster.userId),
                TagInfoContent("coasterName", widget.coasterInfo["body"].coaster.name),
                TagInfoContent("hostName", widget.coasterInfo["body"].hostName),
                TagInfoContent("sessionId", widget.coasterInfo["body"].session.sessionId),
                TagInfoContent("provider", widget.coasterInfo["body"].session.provider),
                Spacer()
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget TagInfoContent(String title, String content) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$title: ",
              style: TextStyle(
                fontFamily: FONZFONTTWO,
                fontSize: HEADINGFIVE,
                color: determineColorThemeTextInverse(),
              ),
              textAlign: TextAlign.left,
            ),
            Spacer(),
            // copy to clipboard
            MaterialButton(
            child: Icon(
                Icons.copy,
                color: Colors.white,
            ),
                onPressed: () {
                  _copyToClipboard(content);
                }
              )

    ],
    ),

        Text(
          "$content",
          style: TextStyle(
            fontFamily: FONZFONTTWO,
            fontSize: HEADINGFIVE,
            color: LILAC,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Future<void> _copyToClipboard(String textToCopy) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('Copied to clipboard'),
    // ));
  }

}
