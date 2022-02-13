import 'package:flutter/material.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/screens/quran/reading_item.dart';

class ReadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/backgroundupperdraw.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          buildreadinScreen(context)

        ],

      ),
    );
  }
  Widget buildreadinScreen(context){
    if(appCubit.get(context).hasData==false){
      return CircularProgressIndicator();
    }else{
      return   Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          child: Expanded(child:
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return readingIteem(appCubit.get(context).verses[index]);
              },
              itemCount: appCubit.get(context).verses.length),
          ),
        ),
      );


  }

  }
}
