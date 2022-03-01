import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper2 {
  static Dio dio;
  static inIt() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.quran-tafseer.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    @required String path,
    @required Map<String, dynamic> query,
    Map<String, dynamic> hedrs,
  }) async {
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
