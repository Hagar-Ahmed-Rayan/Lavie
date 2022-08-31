import 'Data.dart';

class Getuserinfo {
  Getuserinfo({
      this.type, 
      this.message, 
      this.data,});

  Getuserinfo.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
  String? type;
  String? message;
  Data ?data;


}