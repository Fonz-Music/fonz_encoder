import 'package:fonz_encoder/ApiFunctions/AdminWebApi.dart';

Future<String> getAdminAccessToken() async {
  var adminAccessTokenResp = await AdminWebApi.getAdminToken();
  var adminAccessToken = adminAccessTokenResp.body["accessToken"];
  return adminAccessToken;
}

