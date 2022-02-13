import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:z/components/componants.dart';

class salaTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12, bottom: 12, top: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.286,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage('assets/images/M-design-rotated.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '03:15',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('Till Duhr',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
            width: double.infinity,
          ),
          salaItem(
              context: context,
              Estring: 'FAJR',
              Tstring: '06:00',
              Astring: 'الفجر'),
          SizedBox(
            height: 19,
          ),
          salaItem(
              context: context,
              Estring: 'Duhr',
              Tstring: '12:00',
              Astring: 'الظهر'),
          SizedBox(
            height: 19,
          ),
          salaItem(
              context: context,
              Estring: 'Asr',
              Tstring: '03:30',
              Astring: 'العصر'),
          SizedBox(
            height: 19,
          ),
          salaItem(
              context: context,
              Estring: 'Maghrib',
              Tstring: '05:30',
              Astring: 'المغرب'),
          SizedBox(
            height: 19,
          ),
          salaItem(
              context: context,
              Estring: 'Isha',
              Tstring: '08:00',
              Astring: 'العشاء'),
        ],
      ),
    );
  }
}