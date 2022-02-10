import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/stats.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuranCubit(),
      child: BlocConsumer<QuranCubit, QuranStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Image(
                image: AssetImage('assets/images/backgroundupperdraw.png'),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 87, 89, 116),
                    ),
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 87, 89, 116),
                        ),
                        onPressed: () {})
                  ],
                  title: Text(
                    QuranCubit.get(context)
                        .titles[QuranCubit.get(context).currentIndex],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                  backgroundColor: Color.fromARGB(255, 22, 31, 87),
                  unselectedIconTheme: IconThemeData(color: Colors.white),
                  selectedIconTheme: IconThemeData(color: Colors.purple),
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
                        ImageIcon(AssetImage('assets/images/radio.png')),
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
