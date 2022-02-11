// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:z/Model/Radios.dart';
//
//
// class radioItemWidget extends StatelessWidget {
//   Radios radio;
//   Function play;
//   Function stop;
//
//
//   radioItemWidget(this.radio,this.play,this.stop);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.07,
//               child: Center(
//                 child: Text(
//                   radio.name ?? 'Unknown',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w900,
//                       fontSize: 27),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.016,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   iconSize: 70,
//                   color: Colors.white,
//                   onPressed: () {
//                     play(radio.radioUrl);
//                   },
//                   icon: Icon(Icons.play_arrow_rounded),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.1,
//                 ),
//                 IconButton(
//                   iconSize: 60,
//                   color: Colors.white,
//                   onPressed: () {
//                     stop();
//                   },
//                   icon: Icon(Icons.pause_rounded),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.04,
//             ),
//             Text(
//               'Swipe for more',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.5),
//                 fontWeight: FontWeight.w900,
//                 fontSize: 10,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
