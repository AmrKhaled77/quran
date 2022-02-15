import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cache_helper/cache_helper.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'package:z/screens/homescreen.dart';

import 'cubit/appCubit/appcubit.dart';
import 'cubit/appCubit/appcubitstats.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inIt();
  await cacheHelper.init();
  String suraName=cacheHelper.GetData(key: 'suraName');
  int  suraID=cacheHelper.GetInt(key: 'suraID');
  runApp(MyApp(suraName,
      suraID
  ));
}

class MyApp extends StatelessWidget {
  final String suraName;
  final int suraID;
  MyApp(this.suraName,this.suraID);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => appCubit()..getChaptersData()..getSalaTimes(),

      child:BlocConsumer<appCubit,ThemeStates>(
        listener: (context, state) {},
        builder:(context, state){
          appCubit.get(context).currentSurahName=suraName;
          appCubit.get(context).currentSurah=suraID;
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);

          return  MaterialApp(
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    color: Colors.white
                  )
              ),
              darkTheme: ThemeData(
                  appBarTheme: AppBarTheme(
                      color: Colors.black
                  )
              ),
              themeMode: appCubit.get(context).isDark?ThemeMode.light:ThemeMode.dark,
              home:HomeScreen()

          );

        } ,


      )

    );

  }

}
