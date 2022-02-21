import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:z/cubit/appCubit/appcubit.dart';


class SebhaScreen extends StatefulWidget {
  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {


  int duration = 0;
  var currentAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Transform.rotate(
                  angle: currentAngle,
                  child: Image.asset(
                    'assets/images/sebha.png',
                    fit: BoxFit.cover,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.075,
                child: Center(
                  child: Text(
                    appCubit.get(context).tspehTyp,

                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 30,
                        fontFamily: 'Amiri',
                        fontWeight: FontWeight.bold),
                  ),

                ),
              ),

            ],

          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),

          Container(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.075,
            child: Slider(
              min: 0.0,
              max: 33.0,
              value: appCubit.get(context).taspeh,
              activeColor: Theme.of(context).primaryColor,
              onChanged: null,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),

          Text("${appCubit.get(context).taspeh.toInt()}",style:
          TextStyle(fontSize: 30,color: Theme.of(context).canvasColor),),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.075,
            child:  ElevatedButton(
                onPressed: () {
                  onTasbeh();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'CLICK',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: 5,
                      fontFamily: 'Amiri'),
                )
            )
          ),
        ],
      ),
    );
  }

  void onTasbeh() {
    setState(() {
      appCubit.get(context).taspeh++;
      currentAngle += 33;
      if (appCubit.get(context).taspeh == 33 && duration == 0) {
        setState(() {
          appCubit.get(context).taspeh = 0.0;
          appCubit.get(context).tspehTyp = 'الحمد لله ';
          duration++;

        });
      }
      if (appCubit.get(context).taspeh == 33 && duration == 1) {
        setState(() {
          appCubit.get(context).taspeh = 0.0;
          appCubit.get(context).tspehTyp = 'لا اله الا الله ';
          duration++;
        });
      }
      if (appCubit.get(context).taspeh == 33 && duration == 2) {
        setState(() {
          appCubit.get(context).taspeh = 0.0;
          appCubit.get(context).tspehTyp = 'الله اكبر';
          duration++;
        });
      }
      if (appCubit.get(context).taspeh == 33 && duration == 3) {
        setState(() {
          appCubit.get(context).taspeh = 0.0;
          appCubit.get(context).tspehTyp = 'سبحان الله';
          duration = 0;
        });
      }
    });
  }
  clickCelpration(){
    if(appCubit.get(context).taspeh==10){
      return Lottie.network('https://assets9.lottiefiles.com/packages/lf20_up2knbon.json',width: 70);
    }else{
      return  ElevatedButton(
          onPressed: () {
            onTasbeh();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Color.fromARGB(221, 123, 30, 137),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'CLICK',
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 5,
                fontFamily: 'Amiri'),
          )
      );
    }
  }
}