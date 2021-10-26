import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fonz_encoder/ApiFunctions/AuthMethods.dart';

import '../ApiConstants.dart';
// import 'package:http/http.dart' as http;



class GuestGetCoasterApi {


  static Future<Map> getCoasterDetails(String uid) async {
    log("im getting called ");
    String endpoint = address + guest + coaster + uid;
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


// get single owned coaster

class CoasterDecoder {

  String name;
  String coasterId;
  bool active;
  bool encoded;
  String userId;
  String group;

  CoasterDecoder({
    this.name,
    this.userId,
    this.coasterId,
    this.active,
    this.group,
    this.encoded
  });

  CoasterDecoder.fromJson(Map<String, dynamic> json) {
    coasterId = json['coasterId'];
    name = json['name'];
    active = json['active'];
    userId = json['userId'];
    group = json['group'];
    encoded = json['encoded'];
  }
}


class SessionDecoder {

  String provider;
  String sessionId;
  bool active;
  String userId;

  SessionDecoder({
    this.provider,
    this.userId,
    this.sessionId,
    this.active});

  SessionDecoder.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    provider = json['provider'];
    active = json['active'];
    userId = json['userId'];
  }
}

class UserDecoder {

  String email;
  String displayName;
  String userId;

  UserDecoder({
    this.email,
    this.userId,
    this.displayName,});

  UserDecoder.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    displayName = json['displayName'];
    userId = json['userId'];
  }
}

class GetHostCoasterDecoder {

  var coaster;
  var session;
  var hostName;

  GetHostCoasterDecoder({
    this.coaster,
    this.session,
    this.hostName
    });

  GetHostCoasterDecoder.fromJson(Map<String, dynamic> json) {
    coaster = json['coaster'];
    session = json['session'];
    hostName = json['hostName'];

    coaster = CoasterDecoder.fromJson(json['coaster']);
    session = SessionDecoder.fromJson(json['session']);

  }
}
class GetAdminCoasterDecoder {

  var coaster;
  var session;
  var user;

  GetAdminCoasterDecoder({
    this.coaster,
    this.session,
    this.user
  });

  GetAdminCoasterDecoder.fromJson(Map<String, dynamic> json) {
    coaster = json['coaster'];
    session = json['session'];
    user = json['user'];

    coaster = CoasterDecoder.fromJson(json['coaster']);
    session = SessionDecoder.fromJson(json['session']);
    user = UserDecoder.fromJson(json['user']);

  }
}

