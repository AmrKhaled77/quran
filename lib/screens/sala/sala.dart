import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/components/componants.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/cubit/appCubit/appcubitstats.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class salaTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
              child: appCubit.get(context).salaTimesHasError
                  ? AlertDialog(
                title: Text(appCubit.get(context).isArbic?"تحذير!":'ALERT!'),
                content: Text(AppLocalizations.of(context).alert),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {}, //Navigator.pop(context, 'OK'),
                    child: Text(AppLocalizations.of(context).alertceck),
                  ),
                ],
              )
                  : buildSalaScreen(context));
        });
  }

  Widget buildSalaScreen(context) {
    if (appCubit.get(context).salaTimesHasData == true) {
      appCubit.get(context).todayDate();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, bottom: 5, top: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage('assets/images/M-design-rotated.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Column(
                    children: [
                      Text(
                        '${appCubit.get(context).salaTimes[0]['date']['gregorian']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${appCubit.get(context).todayDate()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                        width: double.infinity,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Fajr',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Fajr']}',
                          Astring: 'الفجر'),
                      SizedBox(
                        height: 19,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Sunrise',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Sunrise']}',
                          Astring: 'الشروق'),
                      SizedBox(
                        height: 19,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Zuhr',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Dhuhr']}',
                          Astring: 'الظهر'),
                      SizedBox(
                        height: 19,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Asr',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Asr']}',
                          Astring: 'العصر'),
                      SizedBox(
                        height: 19,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Maghrib',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Maghrib']}',
                          Astring: 'المغرب'),
                      SizedBox(
                        height: 19,
                      ),
                      salaItem(
                          context: context,
                          Estring: 'Isha',
                          Tstring:
                              '${appCubit.get(context).salaTimes[0]['times']['Isha']}',
                          Astring: 'العشاء'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      );
    }
  }
}

// Future ShowNotification ()async{
//   var androidDetails=new AndroidNotificationDetails("channelId", 'local notification',
//       'this is the descraption ',importance: Importance.high);
//   var IosDetails=new IOSNotificationDetails();
//   var genaralNotfcitionDetails=new NotificationDetails(android: androidDetails,
//       iOS:
//       IosDetails
//   );
//   await LocalNotification.show(0, "title", "body",
//       notificationDetails: androidDetails);
//
// }
//
// AndroidFlutterLocalNotificationsPlugin LocalNotification;
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   var androidInatiliaz=new AndroidInitializationSettings('ic_launcher');
//   var ios=new IOSInitializationSettings();
//   var initilazaSetting=new InitializationSettings(
//       android: androidInatiliaz,
//       iOS: ios);
//   LocalNotification=
//   new AndroidFlutterLocalNotificationsPlugin();
//   LocalNotification.initialize(androidInatiliaz);
//
//
// }
