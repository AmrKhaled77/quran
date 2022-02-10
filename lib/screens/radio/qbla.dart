import 'package:flutter/material.dart';


class  radioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/r.png'),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Text('اذاعه القران الكريم',style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w900,fontSize: 20
        ),),
        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){},
                child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 50,)),
            InkWell(
                onTap: (){},
                child: Icon(Icons.play_arrow,color: Colors.white,size: 50,)),
            InkWell(
                onTap: (){},
                child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 50,)),



          ],

        ),



      ],


    );
  }
}