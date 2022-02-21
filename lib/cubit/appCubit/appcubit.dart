import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:z/cache_helper/cache_helper.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'appcubitstats.dart';


class appCubit extends Cubit<ThemeStates>{
  appCubit() : super(ThemeIniialState());

  static appCubit get(context) => BlocProvider.of(context);

bool isDark=false;
bool hasData=false;

void ChangeTheme(){
  isDark=!isDark;
  emit(AppChangeThemeSTete());
}
List<dynamic> chapters=[];

void getChaptersData(){
emit(quranGetDataLoding());
  DioHelper.getData(hedrs: {
    'Content-Type':'application/json',
    'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
  },path: 'v1/quran/Chapters', query: {
    'language':'eg',
  }

  ).then((value) {

    chapters=value.data['chapters'];
    hasData=!hasData;
    print(chapters[0]['name']);
    emit(quranGetDataSucsses());
  }).catchError((error){
    emit(quranGetDataError());
    print(error.toString());
  });
}
bool hasDat=false;
int total_pages;
  List<dynamic> verses=[];
  void getChapterVerses({
  @required int chapter,
    int  page=1,
}){
    emit(quranGetDataLoding());
    DioHelper.getData(hedrs: {
      'Content-Type':'application/json',
      'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
    },path: 'v1/quran/Verses', query: {
      'chapter':chapter,
      'page':page
    }

    ).then((value) {

      verses.addAll(value.data['verses']);
      verses.sort((a, b) => a['number'].compareTo(b['number']));
      hasDat=!hasData;


      emit(quranGetDataSucsses());
    }).catchError((error){
      emit(quranGetDataError());
      print(error.toString());
    });
  }
  int lastRead=3;
  List<dynamic> search=[];
  void getSearchVerses(String Search ){
    emit(quranGetDataLoding());
    DioHelper.getData(hedrs: {
      'Content-Type':'application/json',
      'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
    },path: 'v1/quran/Search', query: {
      'query':Search,


    }

    ).then((value) {

      search =value.data['results'];

      print(search[1]['text']);
      emit(quranGetDataSucsses());
    }).catchError((error){
      emit(quranGetDataError());
      print(error.toString());
    });
  }

  bool salaTimesHasData=false;
List<dynamic> salaTimes=[];
  void getSalaTimes(){
    emit(quranGetDataLoding());
    DioHelper.getData(hedrs: {
      'Content-Type':'application/json',
      'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
    },path: 'v1/prayer/Times', query: {
      'location':'cairo',


    }

    ).then((value) {

      salaTimes =value.data['times'];
      salaTimesHasData=!salaTimesHasData;

      print(salaTimes[1]['times']);
      emit(quranGetDataSucsses());
    }).catchError((error){
      emit(quranGetDataError());
      print(error.toString());
    });
  }





   String todayDate() {
    var now = new DateTime.now();
    String formattedTime = DateFormat("h:mm").format(now);
    return formattedTime;


  }
  int currentSurah = 1;
  String currentSurahName='a';

  void saveDataCache(context,String value,String key){
    cacheHelper.PutData(key: key, value: value);
    emit(SavedataState());

  }
  void saveInt(context,int value,String key)
  {
    cacheHelper.PutInt(key: key, value: value);
    emit(SavedataState());
  }

int totalPages;
  void getTotalPages({
    @required int chapter,
    int  page=1,
  }){
    emit(quranGetDataLoding());
    DioHelper.getData(hedrs: {
      'Content-Type':'application/json',
      'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
    },path: 'v1/quran/Verses', query: {
      'chapter':chapter,
      'page':page
    }

    ).then((value) {

      totalPages=value.data['total_pages'];


      emit(quranGetDataSucsses());
    }).catchError((error){
      emit(quranGetDataError());
      print(error.toString());
    });
  }
  String tspehTyp = 'سبحان الله';
  double taspeh = 0.0;
}
