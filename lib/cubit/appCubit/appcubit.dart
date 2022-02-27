import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:z/cache_helper/cache_helper.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'package:z/dio_helpr/salaTimes_Dio.dart';
import 'appcubitstats.dart';


class appCubit extends Cubit<ThemeStates>{
  appCubit() : super(ThemeIniialState());

  static appCubit get(context) => BlocProvider.of(context);

bool isDark=false;
bool isArbic=false;
bool hasData=false;
  void ChangeLANG({bool ISARBICK}){
    if(ISARBICK!=null){
      isDark=ISARBICK;
    }else
      isArbic=!isArbic;
    emit(AppChangeThemeSTete());
    // cacheHelper.Putbool(key: 'ISARBICK', value: isDark).then((value) => {
    //   emit(AppChangeThemeSTete())
   // });

  }

void ChangeTheme({bool ISDARK}){
  if(ISDARK!=null){
    isDark=ISDARK;
  }else
  isDark=!isDark;
  cacheHelper.Putbool(key: 'isDark', value: isDark).then((value) => {
  emit(AppChangeThemeSTete())
  });

}

List<dynamic> chapters=[];
bool hasError=false;
  void getChaptersData(){
    emit(quranGetDataLoding());
    DioHelper.getData(path: 'api/v4/chapters',
        query: {
          'language':"en"
        }
    ).then((value) {

      chapters=value.data['chapters'];
      hasData=!hasData;
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
    DioHelper.getData(path: 'api/v4/quran/verses/indopak',
        query: {
          'chapter_number':chapter
        }

    ).then((value) {
      verses=value.data['verses'];
      // verses.sort((a, b) => a['number'].compareTo(b['number']));
      // hasDat=!hasData;


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
    DioHelper.getData(path: 'api/v4/search',
        query: {
          'q':Search
        }

    ).then((value) {

      search =value.data['search']['results'];

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
    DioHelper1.getData(path: 'v2/times/day.json', query: {
      'city':'cairo',
      'date':'2022-02-25'


    }

    ).then((value) {
      salaTimes =value.data['results']['datetime'];
      print(salaTimes[0]['times']['Fajr']);
      salaTimesHasData=!salaTimesHasData;
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
  void saveInt(context,int value,String key) {
    cacheHelper.PutInt(key: key, value: value);
    emit(SavedataState());
  }


  String tspehTyp = 'سبحان الله';
  double taspeh = 0.0;

}
