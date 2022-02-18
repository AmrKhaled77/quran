import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/stats.dart';



import 'package:z/screens/quran/quran.dart';

import 'package:z/screens/radio/radio.dart';
import 'package:z/screens/sala/sala.dart';
import 'package:z/screens/sebha/sebha.dart';


class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranIniialState());

  static QuranCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    quranSccreen(),
    salaTimesScreen(),
    HadethScreen(),
    SebhaScreen(),
  ];
  List<String> titles = [
    "Quran",
    "Sala",
    "Qbla",
    "Sebha",
  ];

  void ChangeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarSTete());
  }
}
