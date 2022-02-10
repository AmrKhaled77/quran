import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget salaItem(
    {@required context,
      @required String Estring,
      @required String Tstring,
      @required String Astring}) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.07,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(width: 10, color: Colors.purple),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                Estring,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                Tstring,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(width: 10, color: Colors.purple),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                Astring,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}