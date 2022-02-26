import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:z/cache_helper/cache_helper.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'package:z/screens/homescreen.dart';
import 'package:z/screens/on_boarding/on_boarding.dart';
import 'cubit/appCubit/appcubit.dart';
import 'cubit/appCubit/appcubitstats.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inIt();
  await cacheHelper.init();
  String suraName=cacheHelper.GetData(key: 'suraName');
  int  suraID=cacheHelper.GetInt(key: 'suraID');
  bool isDark =cacheHelper.Getbool(key: 'isDark');
  bool isarbic =cacheHelper.Getbool(key: 'ISARBICK');
  runApp(MyApp(suraName,
      suraID,isDark,isarbic
  ));
}

class MyApp extends StatelessWidget {
  final String suraName;
  final int suraID;
  final bool isDark;
  final bool isarbic;
  MyApp(this.suraName,this.suraID,this.isDark,
      this.isarbic);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (BuildContext context) => appCubit()..getChaptersData()..getSalaTimes()
        ..ChangeTheme(
           ISDARK: isDark
        )..ChangeLANG(ISARBICK: isarbic),

        child:BlocConsumer<appCubit,ThemeStates>(
          listener: (context, state) {},
          builder:(context, state){
            appCubit.get(context).currentSurahName=suraName;
            appCubit.get(context).currentSurah=suraID;
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,

            ]);

            return  MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales:AppLocalizations.supportedLocales,
locale: appCubit.get(context).isArbic? Locale('ar', ''):Locale('en', ''),
              theme: ThemeData(
                primaryColor: Colors.black,
                accentColor:Colors.white,
                canvasColor: Colors.black,

              ),
              darkTheme: ThemeData(
                  primaryColor: Colors.deepPurple,
                  accentColor: Color.fromARGB(255, 22, 31, 87),
                  canvasColor: Colors.white
              ),
              themeMode: appCubit.get(context).isDark?ThemeMode.light:ThemeMode.dark,

              home:AnimatedSplashScreen(
                splash: Column(
                  children: [
                    SizedBox(
                      height:200 ,
                    ),
                    Image.asset("assets/images/icon.png",
                    fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text('ISLAMY',style: TextStyle(color:
                    appCubit.get(context).isDark?Colors.black:Colors.white
                        ,fontSize: 55,
                        fontWeight: FontWeight.w900, fontFamily: 'Amiri'
                    ),),
                    Text('by AMR KHALED',style: TextStyle(color:
                    Colors.grey,fontSize: 8,

                    ),),
                    Text('designed by OMAR',style: TextStyle(color:
                    Colors.grey,fontSize: 8,

                    ),)

                  ],
                ),
                splashIconSize: 1000,
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: appCubit.get(context).isDark?Colors.white:Colors.deepPurple,
                nextScreen: OnBording(),
              ),
              debugShowCheckedModeBanner: false,


            );

          } ,


        )

    );

  }

}





