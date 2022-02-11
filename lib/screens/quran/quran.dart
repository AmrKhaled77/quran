import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:z/screens/cubit/appCubit/appcubit.dart';
import 'package:z/screens/quran/suraitem.dart';

class quranSccreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12, bottom: 12, top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, //color of border
                    //width of border
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Stack(fit: StackFit.expand, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage('assets/images/lastread.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/images/bookmark.png',
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'Last Read',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EL FATEHA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                            Text('SURAH NO: 1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return surahItem(context,appCubit.get(context).chapters[index]);
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 1,
                    color: Color.fromARGB(255, 87, 89, 116),
                  ),
                );
              },
              itemCount: appCubit.get(context).chapters.length),
        )
      ],
    );
  }
}
