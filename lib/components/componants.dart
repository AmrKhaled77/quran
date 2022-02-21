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
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/M-design-rotated.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                Estring,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            child: Center(
              child: Text(
                Tstring,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).canvasColor),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/M-design-unrotated.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Center(
                    child: Text(
                      Astring,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontFamily: 'Amiri',
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}