import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  String baseUrl;
  DioHelper(this.baseUrl);

  static Dio dio;
  static inIt(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://api.quran.com/',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({
    @required String path,
    Map<String,dynamic> query,
    Map<String,dynamic> hedrs,
  })async{
    return await dio.get(path,queryParameters:query,options: Options(
        headers: hedrs
    ));
  }
}