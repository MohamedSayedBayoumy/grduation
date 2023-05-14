import 'package:flutter/material.dart';
import 'package:graduationproject2/StudentScreen/StudentInfo.dart';
import 'package:graduationproject2/TeacherScreen/TeacherHome.dart';
import 'package:graduationproject2/firstpage.dart';
import 'package:graduationproject2/StudentScreen/favourite.dart';
import 'package:graduationproject2/provider/favourite_provide.dart';
import 'StudentScreen/Homeoage.dart';
import 'StudentScreen/Registration.dart';
import 'StudentScreen/login.dart';
import 'TeacherScreen/video.dart';
import 'TeacherScreen/registrationTeacher.dart';
import 'TeacherScreen/registrationTeacher2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Firstpge(),
      routes: {
        'register': (context) => RegistrationScreen(),
        'Home': (context) => HomeScreen(),
        'login': (context) => Login(),
        'teacherreg': (context) => RegistrationTeacher(),
        'teacherreg2': (context) => Registrationteacher2(),
        'teacherHome': (context) => TeacherhomeScreen(),
        'video': (context) => test(),
        'favourite': (context) => favourite(),
        'profileinfo': (context) => StudentInfo(),
      },
    );
  }
}
