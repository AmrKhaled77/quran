import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/screens/quran/reeding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget surahItem(context, chaptres) {
  var StarColor=Colors.purple;
  var idVersessColor=Colors.white;
  var ChaptersEnglishColor=Colors.white;
  var ChaptersArbicColor=Colors.purple;
  var numberVersessColor=appCubit.get(context).isDark?Colors.black:Colors.white30;
  return InkWell(
    onTap: () {
      for(int i=1;i<30;i++){
        appCubit.get(context).getChapterVerses(
            chapter: chaptres['id'],
            page: i
        );
      }
      appCubit.get(context).verses.clear();
      Navigator.push(context, MaterialPageRoute(builder:(context)=>ReadingScreen() ));
// appCubit.get(context).getChapterVerses( chapter: chaptres['id']);
      appCubit.get(context).currentSurah = chaptres['id'];
      appCubit.get(context).currentSurahName
      =appCubit.get(context).chapters[appCubit.get(context).currentSurah - 1]['name'];
      appCubit.get(context).saveDataCache
        (context, appCubit.get(context).currentSurahName, 'suraName');
      appCubit.get(context).saveInt(context,appCubit.get(context).currentSurah , 'suraID');





    },
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.122,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/star.png'),
                  color:Theme.of(context).primaryColor,
                  size: 40,
                ),
                Text(
                  '${chaptres['id']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:  Theme.of(context).canvasColor,
                      fontSize: 12),
                ),
              ],
            ),
          ), // surah number border
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${chaptres['name'].toUpperCase()}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:  Theme.of(context).canvasColor),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${chaptres['revelation_place'].toUpperCase()} ● ${chaptres['verses']} VERSES',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color:numberVersessColor),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.31,
            child: Text(
              '${chaptres['arabic_name'].toUpperCase()}',
              style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
              textAlign: TextAlign.right,

            ),
          ),
        ],
      ),
    ),
  );
}