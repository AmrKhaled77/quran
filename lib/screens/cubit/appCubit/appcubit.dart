import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/dio_helpr/dio_helper.dart';
import 'package:z/screens/cubit/appCubit/appcubitstats.dart';


class appCubit extends Cubit<ThemeStates>{
  appCubit() : super(ThemeIniialState());

  static appCubit get(context) => BlocProvider.of(context);

bool isDark=false;

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
    print(chapters[0]['name']);
    emit(quranGetDataSucsses());
  }).catchError((error){
    emit(quranGetDataError());
    print(error.toString());
  });
}
}
