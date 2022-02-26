import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/stats.dart';
import 'package:z/screens/qubla/qubla.dart';
import 'package:z/screens/quran/quran.dart';
import 'package:z/screens/sala/sala.dart';
import 'package:z/screens/sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranIniialState());

  static QuranCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    quranSccreen(),
    salaTimesScreen(),
    QublaScreen(),
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





