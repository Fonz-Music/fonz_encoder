

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ApiConstants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'AuthMethods.dart';
import 'GuestApi/GuestGetCoasterApi.dart';



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
    // log("secret is " + superSecret);

    var secretSansSlash = superSecret.replaceAll("\\", "");
    // log("secretSans is " + secretSansSlash);
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

  static Future<Map> getAdminCoasterDetails(String uid) async {
    log("im getting called ");
    String endpoint = address + admin + coasters + uid;
    String token = "";
    token = await getAdminAccessTokenAndCheckIfExpired();
    // await FirebaseAuth.instance.currentUser.getIdToken();
    log("endpoint: " + endpoint);

    // dio
    Dio dio = new Dio();

    dio.options.headers = {HttpHeaders.authorizationHeader: 'Bearer $token'};

    log("dio works");
    try {
      var response = await dio.get(endpoint);
      if (response.statusCode == 200) {
//      log('success got coasters');
        log("success");
        log("resp is " + response.data.toString());
        response.data = GetHostCoasterDecoder.fromJson(response.data);
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
      // log("this is msg " + e.response.statusMessage.toString());
      log("this is status " + e.response
          .statusCode.toString());
      // if 403
      if (e.response
          .statusCode == 403) {
        var decoderResp = GetHostCoasterDecoder(coaster: CoasterDecoder(name: "", userId: "", encoded: false, group: "", coasterId: uid), session: SessionDecoder(sessionId: "", provider: ""), hostName: "");
        decoderResp.coaster.coasterId = uid;
        return {
          "statusCode": e.response.data["status"],
          "code": e.response.data["code"],
          "body": decoderResp
        };
      }
      //
      // log("this is mssg" + e.response.data["message"].toString());
      // print("this is mssg" + e.response.data["code"].toString());
      return {
        "statusCode": e.response.data["status"],
        "code": e.response.data["code"],
        "body": e.response.data["message"]
      };
    }

  }

}