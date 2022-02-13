import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/screens/quran/reeding_screen.dart';

Widget surahItem(context, chaptres) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder:(context)=>ReadingScreen() ));
appCubit.get(context).getChapterVerses( chaptres['id']);

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
                  color: Colors.purple,
                  size: 40,
                ),
                Text(
                  '${chaptres['id']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                      color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${chaptres['revelation_place'].toUpperCase()} ● ${chaptres['verses']} VERSES',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white30),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.31,
            child: Text(
              '${chaptres['arabic_name'].toUpperCase()}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    ),
  );
}