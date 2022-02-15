import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper{

static SharedPreferences sharedPreferences;

static init()async{
  sharedPreferences= await SharedPreferences.getInstance();

}
 static Future<bool> PutData({
  @required String key,
  @required String value,
})async{
  
   return await sharedPreferences.setString(key, value);
}


static String GetData({
  @required String key
}){

  return  sharedPreferences.getString(key);
}


static Future<bool> PutInt({
  @required String key,
  @required int value,
})async{

  return await sharedPreferences.setInt(key, value);
}
static int GetInt({
  @required String key
}){

  return  sharedPreferences.getInt(key);
}
}