import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:z/components/componants.dart';

class salaTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 12.0, right: 12, bottom: 12, top: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.286,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red, //color of border
                  //width of border
                ),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        salaItem(
            context: context,
            Estring: 'FAJR',
            Tstring: '06:00',
            Astring: 'الفجر'),
        SizedBox(
          height: 15,
        ),
        salaItem(
            context: context,
            Estring: 'FAJR',
            Tstring: '06:00',
            Astring: 'الفجر'),
        SizedBox(
          height: 15,
        ),
        salaItem(
            context: context,
            Estring: 'FAJR',
            Tstring: '06:00',
            Astring: 'الفجر'),
        SizedBox(
          height: 15,
        ),
        salaItem(
            context: context,
            Estring: 'FAJR',
            Tstring: '06:00',
            Astring: 'الفجر'),
        SizedBox(
          height: 15,
        ),
        salaItem(
            context: context,
            Estring: 'FAJR',
            Tstring: '06:00',
            Astring: 'الفجر'),
      ],
    );
  }
}