import 'package:flutter/material.dart';

Widget readingItem(verses) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      '${verses['text']} ﴿ ${verses['number']} ﴾',
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,fontFamily: 'Amiri'),
    ),
  );
}