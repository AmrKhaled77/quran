import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper1{

  static Dio dio;
  static inIt(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://api.mp3quran.net/',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({
    @required String path,

  })async{
    return await dio.get(path);
  }
}