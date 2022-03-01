import 'package:flutter/material.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/screens/quran/reading_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: appCubit.get(context).isDark
                ? AssetImage('assets/images/backgroundupperdraw.jpg')
                : AssetImage('assets/images/backgroundupperdraw.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 25),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).accentColor),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.095,
                    child: Center(
                        child: Image.asset(
                      'assets/images/basmala.png',
                      fit: BoxFit.fill,
                      color: Theme.of(context).canvasColor,
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(child: buildReadingScreen(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReadingScreen(context) {
    if (appCubit.get(context).verses.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, bottom: 15),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  readingItem(
                      appCubit.get(context).verses[index],
                      appCubit.get(context).isDark
                          ? Colors.black
                          : Colors.white),
                ],
              );
            },
            itemCount: appCubit.get(context).verses.length),
      );
    }
  }
}
