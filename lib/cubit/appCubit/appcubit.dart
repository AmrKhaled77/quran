import 'package:flutter_bloc/flutter_bloc.dart';
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

  List<dynamic> verses=[];
  void getChapterVerses(int chapter ){
    emit(quranGetDataLoding());
    DioHelper.getData(hedrs: {
      'Content-Type':'application/json',
      'Authorization':'Bearer YjcxZGRiNTAtMTZmYS00ZTI5LTkwNTMtMTQwZTI1MDE4NGY4',
    },path: 'v1/quran/Verses', query: {
      'chapter':chapter,


    }

    ).then((value) {

      verses=value.data['verses'];
      hasDat=!hasData;

      print(verses[1]['text']);
      emit(quranGetDataSucsses());
    }).catchError((error){
      emit(quranGetDataError());
      print(error.toString());
    });
  }
  int lastRead=3;
}
