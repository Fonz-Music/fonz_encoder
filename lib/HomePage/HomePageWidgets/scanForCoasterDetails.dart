import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:fonz_encoder/ApiFunctions/HostApi/CoasterManagementApi.dart';
import 'package:fonz_encoder/GlobalComponents/FrontEnd/FrontEndConstants.dart';
import 'package:fonz_encoder/GlobalComponents/Objects/CoasterObject.dart';
import 'package:fonz_encoder/NfcFunctions/WriteTagFunctions.dart';
import 'package:fonz_encoder/NfcFunctions/ReadTagFunctions.dart';

import '../HomeEncodePage.dart';

Future<String> writeUrlToCoaster(uidFromScannedTag) async {
  log("starting to write");
  // write url
  var successfulWrite =
      await WriteTagFunctions.writeUrlOnTag(uidFromScannedTag);
  if (!successfulWrite) {
    return "DID_NOT_WRITE_URL";
  } else {
    // update api
    var updateCoasterResponse =
        await CoasterManagementApi.classifyCoasterAsEncoded(
            uidFromScannedTag, true, groupCoasterBelongs);

    return updateCoasterResponse;
  }
}
Future<String> writeFonzUrlToCoaster(uidFromScannedTag) async {
  log("starting to write");
  // write url
  var successfulWrite =
  await WriteTagFunctions.writeUrlOnTag(uidFromScannedTag);
  if (!successfulWrite) {
    return "DID_NOT_WRITE_URL";
  } else {
    // update api
    var updateCoasterResponse =
    await CoasterManagementApi.classifyCoasterAsEncoded(
        uidFromScannedTag, true, "");

    return updateCoasterResponse;
  }
}

Future<List<String>> scanForTagUid() async {
  log("starting the scan");

  // get uid from coaster
  String uidFromScannedTag = await ReadTagFunctions.readTagUid();

  if (uidFromScannedTag == "NFC_NOT_SUPPORTED") {
    return [uidFromScannedTag, ""];
  } else if (uidFromScannedTag.length == 14) {
    return ["SUCCESS_ON_READ", uidFromScannedTag];
  } else
    return ["DID_NOT_FETCH_UID", ""];
}
