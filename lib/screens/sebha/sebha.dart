

import 'package:flutter/material.dart';


class sebhascreen extends StatefulWidget {
  @override
  _sebhascreenState createState() => _sebhascreenState();
}

class _sebhascreenState extends State<sebhascreen> {
double taspeh=0.0;
String tspehTyp='سبحان الله';
int duration=0;


  @override
  Widget build(BuildContext context) {

    return Column(
mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(tspehTyp,style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800,
        color: Colors.white

        ),),
        SizedBox(height: 70,),
        Text("$taspeh",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 50,
color: Colors.white,
        ),),
  Slider(
    min: 0.0,
    max: 33.0,
    value: taspeh,
    activeColor:Colors.purple ,
    onChanged: (value){
      setState(() {
        taspeh=value;
      });
    },
  ),
        SizedBox(height: 27,),
        Container(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            setState(() {
              taspeh++;
            });
            if(taspeh ==33&&duration==0){
              setState(() {
                taspeh=0.0;
                tspehTyp='الحمد لله ';
                duration++;
              });
            }
            if(taspeh ==33&&duration==1){
              setState(() {
                taspeh=0.0;
                tspehTyp='الله اكبر ';
                duration++;
              });
            }
            if(taspeh ==33&&duration==2){
              setState(() {
                taspeh=0.0;
                tspehTyp='لا الاه الا الله';
                duration++;
              });
            }
            if(taspeh ==33&&duration==3){
              setState(() {
                taspeh=0.0;
                tspehTyp='سبحان الله';
                duration=0;
              });
            }

          },
              style: ElevatedButton.styleFrom(primary: Colors.purple,
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(17.0),
    ),
              ),
              child: Text('taspeh')),
        )


      ],


    );
  }
}
