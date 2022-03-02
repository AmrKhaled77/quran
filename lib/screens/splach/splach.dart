import 'package:flutter/material.dart';
import 'package:z/cubit/appCubit/appcubit.dart';

class Splach extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context
                ).size.height*0.2,
              ),
              Image.asset(
                "assets/images/icon.png",
                fit: BoxFit.fill,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,
              ),
              Center(
                child: Text(
                  'ISLAMY',
                  style: TextStyle(
                      color: appCubit.get(context).isDark
                          ? Colors.black
                          : Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Amiri'),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height*0.05
              ),
              Text(
                'by AMR KHALED',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 8,
                ),
              ),
              Text(
                'designed by OMAR',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 8,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
