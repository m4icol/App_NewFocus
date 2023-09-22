// import 'package:flutter/material.dart';
// import 'package:newfocus_v2/src/constants/colors.dart';

// class TimerCard extends StatelessWidget {
//   const TimerCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           'FOCUS',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width / 3.1,
//               height: 160,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   width: 2,
//                   color: Pallete.borderColor1,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   '12',
//                   style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             const Text(
//               ':',
//               style: TextStyle(
//                   fontSize: 60,
//                   fontWeight: FontWeight.w400,
//                   color: Pallete.borderColor1),
//             ),
//             const SizedBox(width: 15),
//             Container(
//               width: MediaQuery.of(context).size.width / 3.1,
//               height: 160,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   width: 2,
//                   color: Pallete.borderColor1,
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   '00',
//                   style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
