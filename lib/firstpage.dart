import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'classes/Student.dart';
import 'classes/favaurite.dart';
import 'services/api_helper.dart';

class Firstpge extends StatefulWidget {
  const Firstpge({Key? key}) : super(key: key);

  @override
  State<Firstpge> createState() => _FirstpgeState();
}

class _FirstpgeState extends State<Firstpge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              width: 200,

              // decoration: BoxDecoration(
              //   color: Colors.blue,
              //   borderRadius: BorderRadius.circular(100),
              // ),
              child: Center(
                child: Text(
                  'welcome to find totur app',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 230,
                    width: 150,
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'loginST');
                      },
                      child: const Text(
                        'طالب',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 25.0,
                ),
                Container(
                  height: 230,
                  width: 150,
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, 'loginTea');
                    },
                    child: const Text(
                      'استاذ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
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
}
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final double cardWidth = (screenSize.width - 60) / 2;
//     final double cardHeight = screenSize.height * 0.3;
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 200,
//               width: 200,
//               child: Center(
//                 child: Text(
//                   'Welcome to find tutor APP',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: cardHeight,
//                   width: cardWidth,
//                   child: Card(
//                     color: Colors.blue,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, 'login');
//                       },
//                       child: const Text(
//                         'طالب',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 30.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 25.0,
//                 ),
//                 SizedBox(
//                   height: cardHeight,
//                   width: cardWidth,
//                   child: Card(
//                     color: Colors.blue,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, 'video');
//                       },
//                       child: const Text(
//                         'استاذ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 30.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

