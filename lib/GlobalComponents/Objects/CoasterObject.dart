// CoasterInfo is the information handler for the info stored in the coaster
import 'dart:developer';

class CoasterObject {
  String name;
  String coasterId;
  String group;
  String userId;
  int statusCode = 0;
  bool encoded = false;


  CoasterObject(this.name, this.group, this.coasterId, this.userId);

  // CoasterObject.withStatus(this.hostName, this.coasterName, this.sessionId, this.coasterUid, this.statusCode);

  setStatusCode(int code ) {
    this.statusCode = code;
    log("code being set to " + code.toString());
  }

  // int getStatusCode() {
  //   return this.statusCode;
  //   // log("code being set to " + code.toString());
  // }



  updateCoaster(CoasterObject newCoaster) {
    this.coasterId = newCoaster.coasterId;
    this.userId = newCoaster.userId;
    this.name = newCoaster.name;
    this.statusCode = newCoaster.statusCode;
    this.group = newCoaster.group;
    this.encoded = newCoaster.encoded;
  }

}