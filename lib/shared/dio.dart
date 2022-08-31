import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio ?dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,

        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType:ResponseType.json,


      ),


    );
  }

  static Future<Response> getData({
    required dynamic url,
     Map<String, dynamic>? query,
    dynamic? token,
  }) async
  {
    dio?.options.headers =
    {
      'Accept':'application/json',
      'Authorization':'Bearer ${token}',
      //token??'',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required dynamic url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  dynamic? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization': 'Bearer ${token}',
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> patchdata({
    required dynamic url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    dynamic? token,
  }) async
  {
    dio?.options.headers =
    {

    //  'Accept-Encoding':'gzip, deflate, br',
      'Connection':'keep-alive',
      'Content-Type':'application/json',
      'Accept':'application/json',

      'Authorization':'Bearer ${token}',
      //token??'',
    };

    return await dio!.patch(
      url,
      queryParameters: query,
      data:data
    );
  }








}