// String address = 'https://api.fonzmusic.com/';
// String address = "http://52.50.138.97:8080/";
String address = "https://beta.api.fonzmusic.com/";
String spotify = 'spotify/';
String authenticate = 'authenticate/';
String guest = 'guest/';
String host = 'host/';
String queue = 'queue/';
String session = 'session/';
String library = 'library/';
String searchTerm = 'search?term=';
String coaster = 'coaster/';
String coasters = 'coasters/';
String providers = 'providers/';
String providersNoSlash = 'providers';
String auth = 'auth/';
String register = 'register/';
String user = 'user/';
String search = 'search/';
String admin = 'admin/';

// String tempToken =
//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL2FwaS5mb256bXVzaWMuY29tL2F1dGgiLCJleHAiOjE2Mjg0MjUxMTEsInVzZXJJZCI6ImIyZTliYTQ3LWI4OTgtNGE1OS1iYzI1LTU0YTVmY2E3YzIzZSIsInN1YiI6ImIyZTliYTQ3LWI4OTgtNGE1OS1iYzI1LTU0YTVmY2E3YzIzZSIsImVtYWlsIjoiZGlhcm11aWRtY2dAcG0ubWUiLCJlbWFpbFZlcmlmaWVkIjpmYWxzZSwiaWF0IjoxNjI3MjE1NTExfQ.GJW2eyC4FpsGyBTro0slyv9junvx5yE14yQfpoyVeMo";
class BasicHttpResponse {
  int statusCode;
  String code;
  var body;

  BasicHttpResponse(this.statusCode, this.code, this.body);
}