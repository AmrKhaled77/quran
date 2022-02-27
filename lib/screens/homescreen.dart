import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/cubit/cubit.dart';
import 'package:z/cubit/stats.dart';
import 'package:z/screens/search/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> titles = [

      AppLocalizations.of(context).sala,
      AppLocalizations.of(context).sala,
      AppLocalizations.of(context).qbla,
      AppLocalizations.of(context).sebha,
    ];
    return BlocProvider(
      create: (BuildContext context) => QuranCubit(),
      child: BlocConsumer<QuranCubit, QuranStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Image(
                image: appCubit.get(context).isDark?
                AssetImage('assets/images/backgroundupperdraw.jpg'):
                AssetImage('assets/images/backgroundupperdraw.png'),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    appCubit.get(context).GetSalaTimes();
                  },
                ),
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      appCubit.get(context).ChangeLANG();
                    },
                    icon: Icon(
                      Icons.language,
                      color:Theme.of(context).canvasColor,
                    ),
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(
                          Icons.brightness_4_outlined,
                          color: Theme.of(context).canvasColor,
                        ),
                        onPressed: () {
                          appCubit.get(context).ChangeTheme();
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color:Theme.of(context).canvasColor,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>SearchScreen() ));
                        })
                  ],
                  title: Text(
                    titles[QuranCubit.get(context).currentIndex],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                    color: appCubit.get(context).isDark?Colors.black:Colors.white
                    ),
                  ),
                ),
                body: QuranCubit.get(context)
                    .screens[QuranCubit.get(context).currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: QuranCubit.get(context).currentIndex,
                  onTap: (index) {
                    QuranCubit.get(context).ChangeIndex(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).accentColor,
                  unselectedIconTheme: IconThemeData(color: Theme.of(context).canvasColor),
                  selectedIconTheme: IconThemeData(color: Colors.deepPurple
                  ),
                  iconSize: 30,
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage('assets/images/koran.png')),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage('assets/images/mosque.png')),
                        label: ""),
                    BottomNavigationBarItem(
                        icon:
                        ImageIcon(AssetImage('assets/images/compass.png')),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage('assets/images/beads.png')),
                        label: ""),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
