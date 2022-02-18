
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:z/screens/radio/qblaComponants/qibla_compass.dart';


class HadethScreen extends StatelessWidget {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _deviceSupport,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );

        if (snapshot.hasError)
          return Center(
            child: Text('Error: ${snapshot.error.toString()}'),
          );
        if (snapshot.hasData)
          return QiblaCompass();
        else
          return Container(
            child: Text('Error'),
          );
      },
    );
  }
}