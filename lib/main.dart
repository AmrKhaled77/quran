import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'package:z/screens/cubit/appCubit/appcubit.dart';
import 'package:z/screens/cubit/appCubit/appcubitstats.dart';
import 'package:z/screens/homescreen.dart';

void main() {
  DioHelper.inIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => appCubit()..getChaptersData(),
      child:BlocConsumer<appCubit,ThemeStates>(
        listener: (context, state) {},
        builder:(context, state){
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
