

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ApiConstants.dart';


String addressWeb = "https://www.fonzmusic.com/i/";
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

    // dio
    Dio dio = new Dio();

    dio.options.headers = {HttpHeaders.authorizationHeader: 'Bearer $jwtToken'};

    log("dio works");
    try {
      // var response = await dio.post(endpoint, data: {"email": email, "password": password});
      // var response = await dio.get(endpoint, data: {"authToken": jwtToken});
      var response = await dio.get(endpoint);
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
      // log("this is status " + e.response
      //     .statusCode.toString());
      log("this is mssg" + e.response.data["message"].toString());
      print("this is mssg" + e.response.data["code"].toString());
      return {
        "statusCode": e.response.data["status"],
        "code": e.response.data["code"],
        "body": e.response.data["message"]
      };
    }

  }

}