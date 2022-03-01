import 'package:flutter/material.dart';

Widget readingItem(verses, Color color) {
  String verss = verses['verse_key'];
  List versess = verss.split(':');
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Text(
      '${verses['text_indopak']} ﴿${versess[1]}﴾',
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          height: 2,
          letterSpacing: 1.4,
          wordSpacing: 1,
          inherit: false,
          decorationThickness: 2,
          shadows: [Shadow(offset: Offset.infinite, color: color)],
          textBaseline: TextBaseline.ideographic,
          fontFamily: 'Amiri'),
    ),
  );
}
//https://api.quran.com/api/v4/verses/by_chapter/2?language=en&words=true&per_page=10
