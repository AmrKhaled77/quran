// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:z/Model/RadioResponse.dart';
// import 'package:z/screens/radio/radioItem.dart';
//
// class radioScreen extends StatefulWidget {
//   @override
//   State<radioScreen> createState() => _radioScreenState();
// }
//
// class _radioScreenState extends State<radioScreen> {
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           flex: 3,
//           child: Image.asset(
//             'assets/images/purpleradio.png',
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.05,
//         ),
//         FutureBuilder<RadioResponse>(
//           future: getRadios(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Expanded(
//                   flex: 2,
//                   child: ListView.builder(
//                     physics: PageScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.radios.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return radioItemWidget(
//                           snapshot.data.radios.elementAt(index), play, stop);
//                     },
//                   ));
//             } else if (snapshot.hasError) {
//               return Center(
//                   child: Text(
//                 '${snapshot.error}',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 15),
//               ));
//             }
//             return Text('');
//           },
//         ),
//       ],
//     );
//   }
//
//   void play(String url) {
//     audioPlayer.stop();
//     audioPlayer.play(url);
//   }
//
//   void stop() {
//     audioPlayer.pause();
//   }
//
//   Future<RadioResponse> getRadios() async {
//     http.Response response = await http
//         .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       return RadioResponse.fromJson(
//           jsonDecode(utf8.decode(response.bodyBytes)));
//     } else {
//       throw (Exception('Unable to reach sever ${response.statusCode}'));
//     }
//   }
// }
