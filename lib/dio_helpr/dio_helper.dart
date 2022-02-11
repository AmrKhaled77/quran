import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static Dio dio;
  static inIt(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://api.m3o.com/',
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> getData({
  @required String path,
    @required Map<String,dynamic> query,
    @required Map<String,dynamic> hedrs,
})async{
   return await dio.get(path,queryParameters:query,options: Options(
     headers: hedrs
   ));
  }
}