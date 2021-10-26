import 'package:flutter/material.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:flutter/services.dart';
import 'package:fonz_encoder/HomePage/HomeEncodePage.dart';

class CoasterAttributesComp extends StatefulWidget {

  // CoasterAttributesComp({Key key, this.coasterInfo}) : super(key: key);
  //
  // final coasterInfo;

  @override
  _CoasterAttributesCompState createState() => _CoasterAttributesCompState();
}

class _CoasterAttributesCompState extends State<CoasterAttributesComp> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery
        .of(context)
        .size;
    final width = size.width;
    final height = size.height;

    return Container(
      height: height * .9,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [


            TagInfoContent("tagUID", tagInfo.coaster.coasterId  ?? ""),
            TagInfoContent("encoded", tagInfo.coaster.encoded.toString()  ?? ""),
            TagInfoContent("group", tagInfo.coaster.group  ?? ""),
            TagInfoContent("userId", tagInfo.coaster.userId  ?? ""),
            TagInfoContent("coasterName", tagInfo.coaster.name  ?? ""),
            TagInfoContent("hostName", tagInfo.user.displayName  ?? ""),
            TagInfoContent("sessionId", tagInfo.session.sessionId  ?? ""),
            TagInfoContent("provider", tagInfo.session.provider  ?? ""),
            Spacer()
          ],
        )
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
                color: Colors.white,
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
