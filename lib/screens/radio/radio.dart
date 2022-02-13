import 'dart:convert';
import 'package:flutter/material.dart';

class radioScreen extends StatefulWidget {
  @override
  State<radioScreen> createState() => _radioScreenState();
}

class _radioScreenState extends State<radioScreen> {


  @override

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            'assets/images/purpleradio.png',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),

      ],
    );
  }

}
