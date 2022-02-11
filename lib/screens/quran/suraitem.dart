import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget surahItem(context,chapter) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/star.png'),color: Colors.purple,
                  size: 35,
                ),
                Text(
                  '${chapter['id']}',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
          ), // surah number border
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${chapter['name']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '${chapter['revelation_place']} ● ${chapter['verses']} VERSES',
                style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white30),
              ),
            ],
          ),
          SizedBox(
            width: 55,
          ),
          Text(
            '${chapter['arabic_name']}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.purple,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
