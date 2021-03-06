import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fonz_encoder/GlobalComponents/ExceptionHandling.dart';


import 'package:nfc_in_flutter/nfc_in_flutter.dart';





// Host class contains the static methods for writing to the coaster
class WriteTagFunctions {
// for platform specific code
  static const platformVar = const MethodChannel("readUidPlatform");

  // Writes the needed information to the coaster
  static Future<bool> writeUrlOnTag(String uid) async {
    // try {
      bool wroteSuccessfully = false;
      Stream<NDEFTag> _stream;
      // do you need this? since its always called in _grabCoasterUid() anyways
      bool _isNFCSupported = await NFC.isNDEFSupported;
      //
      if (_isNFCSupported) {
        log("nfc is suppoted");
//        var _stream =
        if (Platform.isIOS) {
          var writeResp = await writeNFCTagForIos(uid);
          if (writeResp == "SUCCESS_ON_WRITE") wroteSuccessfully = true;
        } else {
          var writeAndroid = await NFC.writeNDEF(await _buildMessage(uid), message: 'Activating your Fonz Coaster!', once: true).first;
          wroteSuccessfully = true;
        }
      } else {
        log("nfc isnt suppoted");
      }
      return wroteSuccessfully;

  }
  // Writes the needed information to the coaster
  static Future<bool> writeUrlOnTagWithVenue(String uid, String venue) async {
    // try {
    bool wroteSuccessfully = false;
    Stream<NDEFTag> _stream;
    // do you need this? since its always called in _grabCoasterUid() anyways
    bool _isNFCSupported = await NFC.isNDEFSupported;
    //
    if (_isNFCSupported) {
      log("nfc is suppoted");
//        var _stream =
      if (Platform.isIOS) {
        var writeResp = await writeNFCTagForIosWithVenue(uid, venue);
        if (writeResp == "SUCCESS_ON_WRITE") wroteSuccessfully = true;
      } else {
        var writeAndroid = await NFC.writeNDEF(await _buildMessageWithVenue(uid, venue), message: 'Activating your Fonz Coaster!', once: true).first;
        wroteSuccessfully = true;
      }
    } else {
      log("nfc isnt suppoted");
    }
    return wroteSuccessfully;

  }

  static Future<NDEFMessage> _buildMessage(String uid) async {
    List<NDEFRecord> _records = [];
    // var plainUrl = "fonzmusic.com/" + uid;
    var fonzUrl = Uri.https("fonzmusic.com", uid);
    // var fonzUrl = "fonzmusic.com/" + uid;
    log("url is " + fonzUrl.toString());
    NDEFRecord url = new NDEFRecord.uri(fonzUrl);
    // NDEFRecord url = new NDEFRecord.plain(data)
    // log("ndef url is " + url.);
    _records.add(url);
    log("added rec hrer");
    return NDEFMessage.withRecords(_records);
  }
  static Future<NDEFMessage> _buildMessageWithVenue(String uid, String venue) async {
    List<NDEFRecord> _records = [];
    // var plainUrl = "fonzmusic.com/" + uid;
    var fonzUrl = Uri.https("fonzmusic.com/$venue", uid);
    // var fonzUrl = "fonzmusic.com/" + uid;
    log("url is " + fonzUrl.toString());
    NDEFRecord url = new NDEFRecord.uri(fonzUrl);
    // NDEFRecord url = new NDEFRecord.plain(data)
    // log("ndef url is " + url.);
    _records.add(url);
    log("added rec hrer");
    return NDEFMessage.withRecords(_records);
  }

  // static Future<NDEFMessage> buildUrlWithUid(String uid) async {
  //   List<NDEFRecord> _records = [];
  //   var fonzUrl = Uri(path: "fonzmusic.com/" + uid, scheme: "https://");
  //   NDEFRecord url = new NDEFRecord.uri(fonzUrl);
  //
  //   _records.add(url);
  //   return NDEFMessage.withRecords(_records);
  // }
  //
  // static Future<void> updateNFC() async {
  //   bool _isNdefSupported = await NFC.isNDEFSupported;
  // }

  static Future<String> writeNFCTagForIos(String uid) async {
    String message;
    try {
      var result = await platformVar.invokeMethod('writeFonzUrl', {"uid": uid});
      message = result;
      log("uid is " + message);
      return message;
    } on PlatformException catch (e) {
      return e.message.toString();
    }
  }

  static Future<String> writeNFCTagForIosWithVenue(String uid, String venue) async {
    String message;
    try {
      var result = await platformVar.invokeMethod('writeFonzUrlWithVenue', {"uid": uid, "venue": venue});
      message = result;
      log("uid is " + message);
      return message;
    } on PlatformException catch (e) {
      return e.message.toString();
    }
  }


}