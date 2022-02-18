import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double taspeh = 0.0;
  String tspehTyp = 'سبحان الله';
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
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.075,
                child: Center(
                  child: Text(
                    tspehTyp,

                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
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
              value: taspeh,
              activeColor: Colors.purple,
              onChanged: null,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),
          Text("${taspeh.toInt()}",style: TextStyle(fontSize: 30,color: Colors.white),),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.075,
            child: ElevatedButton(
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
            ),
          ),
        ],
      ),
    );
  }

  void onTasbeh() {
    setState(() {
      taspeh++;
      currentAngle += 33;
      if (taspeh == 33 && duration == 0) {
        setState(() {
          taspeh = 0.0;
          tspehTyp = 'الحمد لله ';
          duration++;
        });
      }
      if (taspeh == 33 && duration == 1) {
        setState(() {
          taspeh = 0.0;
          tspehTyp = 'لا اله الا الله ';
          duration++;
        });
      }
      if (taspeh == 33 && duration == 2) {
        setState(() {
          taspeh = 0.0;
          tspehTyp = 'الله اكبر';
          duration++;
        });
      }
      if (taspeh == 33 && duration == 3) {
        setState(() {
          taspeh = 0.0;
          tspehTyp = 'سبحان الله';
          duration = 0;
        });
      }
    });
  }
}