import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fonz_encoder/ApiFunctions/AdminWebApi.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/HomePage/HomeEncodePage.dart';
import 'package:fonz_encoder/HomePage/HomePageWidgets/scanForCoasterDetails.dart';


class EncodeTagField extends StatefulWidget {
  EncodeTagField({Key key, this.coasterUid, this.popupContext, this.notifyParent}) : super(key: key);
  final popupContext;
  final coasterUid;
  final notifyParent;

  @override
  _EncodeTagFieldState createState() => _EncodeTagFieldState();
}

class _EncodeTagFieldState extends State<EncodeTagField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      // contentPadding: EdgeInsets.all(0),

      insetPadding: EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
      // insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius
              .circular(CORNERRADIUSBUTTON)
      ),
      backgroundColor: determineColorThemeBackground(),
      title:
      Container(
        width: width * 0.8,
        color: LILAC,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'select venue',
                style: TextStyle(
                  fontFamily: FONZFONTONE,
                  fontSize: HEADINGFIVE,
                  color: Colors.white,
                ),
                textAlign: TextAlign
                    .center,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child:  Center(
                child: Container(
                  height: 25,
                  width: 30,
                  child: Image(
                    image: AssetImage(
                        "assets/lightGreyIcons/coasterIconLightGrey.png"),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "what's this tags's new venue?",
                style: TextStyle(
                  fontFamily: FONZFONTONE,
                  fontSize: HEADINGFIVE,
                  color: determineColorThemeTextInverse(),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SelectVenue(),
          ],
        )
      ],
    );
  }

  Widget SelectVenue() {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
      height: 50,
      width: width * 0.6,
      child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.white,
              shadowDarkColor: SHADOWGREY,
              shadowLightColor: SHADOWGREY),
          child: Container(
            padding: EdgeInsets.fromLTRB(10,0, 0, 0),
            child: DropdownButton<String>(
              hint: venueTagBelongs == null
                  ? Text('dropdown')
                  : Text(
                venueTagBelongs,
                style: TextStyle(
                  fontFamily: FONZFONTTWO,
                  fontSize: HEADINGFIVE,
                  color: DARKERGREY,
                ),
              ),
              style: TextStyle(
                fontFamily: FONZFONTTWO,
                fontSize: HEADINGFIVE,
                color: DARKERGREY,
              ),
              isExpanded: true,
              onChanged: (value) async {
                setState(() async {
                  print("venue " + value);
                  venueTagBelongs = value;
                  await writeUrlToCoaster(tagInfo.coaster.coasterId, venueTagBelongs);
                  var updatedCoaster = await AdminWebApi.getAdminCoasterDetails(tagInfo.coaster.coasterId);
                  tagInfo = updatedCoaster.body;
                  widget.notifyParent();
                  Navigator.pop(widget.popupContext);
                });
              },
              items: potentialVenues.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
      ),
    );
  }

}
