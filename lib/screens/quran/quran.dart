import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/cubit/appCubit/appcubitstats.dart';
import 'package:z/screens/quran/reeding_screen.dart';
import 'package:z/screens/quran/suraitem.dart';

class quranSccreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,ThemeStates>(
      listener:(context,state){},
      builder:(context,state){
        return  Column(
          children: [
            InkWell(
              onTap: () {

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ReadingScreen()));
                  // appCubit.get(context).getChapterVerses(
                  //   chapter: appCubit.get(context).currentSurah,
                  // );
                  for(int i=1;i<30;i++){
                    appCubit.get(context).getChapterVerses(
                      chapter: appCubit.get(context).currentSurah,
                      page: i
                    );
                  }
                  appCubit.get(context).verses.clear();



              },
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
                                Text('${GetlastRead(context)}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                Text('SURAH NO: ${appCubit.get(context).currentSurah}',
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
            BuildQuranScreen(context)

          ],
        );
      },

    );



  }
  Widget BuildQuranScreen(context){
    if(appCubit.get(context).hasData ==false){
      return Center(
        child: CircularProgressIndicator(),

      );

    }else{
      print(appCubit.get(context).lastRead);
      return  Expanded(
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
      );
    }
  }
  String GetlastRead(context){
    if(appCubit.get(context).currentSurahName==null)
      {return '';}
    else{
      return appCubit.get(context).currentSurahName;
    }
  }
}
