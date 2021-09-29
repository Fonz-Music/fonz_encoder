

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ApiConstants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



String addressWeb = "https://fonzmusic.com/i/";
String admin = "admin/";
String token = "token/";

class AdminWebApi {


  static Future<Map> getAdminToken() async {
    log("im getting called ");
    String endpoint = addressWeb + admin + token;
    String jwtToken = "";
    jwtToken = await FirebaseAuth.instance.currentUser.getIdToken();
    // await FirebaseAuth.instance.currentUser.getIdToken();
    log("endpoint: " + endpoint);
    log("jwt is " + jwtToken);

   var superSecret = dotenv.env['superSecret'].replaceAll("\$", r"\$");
    log("secret is " + superSecret);

    var secretSansSlash = superSecret.replaceAll("\\", "");
    log("secretSans is " + secretSansSlash);
    // dio
    Dio dio = new Dio();

    dio.options.headers = {HttpHeaders.authorizationHeader: 'Bearer $jwtToken'};

    log("dio works");
    try {
      // var response = await dio.post(endpoint, data: {"email": email, "password": password});
      var response = await dio.post(endpoint, data: {"authToken": secretSansSlash});
      // var response = await dio.get(endpoint);
      if (response.statusCode == 200) {
//      log('success got coasters');
        log("success");
        log("response is " + response.toString());
        log("resp is " + response.data.toString());
        // response.data = GetHostCoasterDecoder.fromJson(response.data);
      } else {
        log("error ");
        log('error with response code ${response.statusCode} and body '
        // ' ${response.body}');
            ' ${response.data}');
        return null;
      }
      // log("response message " + response.statusMessage);
      // log("response code " + response.statusCode.toString());
      return {"statusCode": response.statusCode, "code": response.statusMessage,
        "body": response.data};
    }
    on DioError catch (e) {
      log("status code " +e.response.data["statusCode"].toString());
      log("status code " +e.response.toString());
      return {
        "statusCode": e.response.data["status"],
        "code": e.response.data["code"],
        "body": e.response.data["message"]
      };
    }

  }

}