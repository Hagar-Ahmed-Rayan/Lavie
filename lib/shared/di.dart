import 'package:dio/dio.dart';
void getHttp() async {
  try {
    var response = await Dio().get('/api/v1/auth/signin');
    print("nnnnnnnnnnnnnnnnnnn");
    print(response);
    print(response.statusMessage);

    print(response.data['id']);
    print(response.data['firstName']);

  } catch (e) {
    print(e);
  }
}