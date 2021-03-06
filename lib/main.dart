import 'dart:developer';
import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonz_encoder/ApiFunctions/AdminWebApi.dart';

import 'package:fonz_encoder/GlobalComponents/CoreUserAttributes.dart';

import 'package:fonz_encoder/HomePage/HomeEncodePage.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'MustUpdateApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

bool userSignedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // log("part 1 is " + partsOfVersion[0] + "part 2 is " + partsOfVersion[1] + "part 3 is " + partsOfVersion[2]);


  var platform;
  if (Platform.isIOS) {
    platform = "iOS";
  }
  else {
    platform = "Android";
  }

  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User user) async {
    if (user == null) {
      userSignedIn = false;
      print('User is currently signed out!');
    } else {
      userSignedIn = true;
      // var jwt = await FirebaseAuth.instance.currentUser.getIdToken();
      // log("the jwt is " + jwt);
      // await AdminWebApi.getAdminToken();
      // print('User is signed in!');
    }
  });

  await dotenv.load(fileName: ".env");
  runApp(FonzMusicApp());
}



class FonzMusicApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            home: MyHomePage(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image(
            image: AssetImage("assets/fonzIcons/splashImage.png"),
          )
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  refresh() async {
    // await userAttributes.setAttributes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    darkMode = brightnessValue == Brightness.dark;





    return
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          // backgroundColor: LILAC,
          body: HomeEncodePage(notifyParent: refresh,)
        );


  }

}
