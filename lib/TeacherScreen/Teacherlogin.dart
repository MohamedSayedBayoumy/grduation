// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Api.dart';
// import '../loginuser.dart';
// import 'package:http/http.dart' as http;
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   static Future<user?> login(String username, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedUsername = prefs.getString('username');
//     String? storedPassword = prefs.getString('password');
//
//     if (storedUsername == username && storedPassword == password) {
//       String? name = prefs.getString('name');
//       return user(name: name!, username: username);
//     } else {
//       return null;
//     }
//   }
//
//   final _formKey = GlobalKey<FormState>();
//   late String _username;
//   late String _password;
//   Students? _students;
//   final _passwordController = TextEditingController();
//   final _usernameController = TextEditingController();
//   Future<Students?> submitData(String username, String password) async {
//     var response =
//         await http.post(Uri.parse('https://reqres.in/api/users'), body: {
//       'username': _username,
//       'password': _password,
//     });
//     var data = response.body;
//
//     if (response.statusCode == 201) {
//       String responseString = response.body;
//       studentFromjson(responseString);
//     } else {
//       return null;
//     }
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       user? userr = await login(_username, _password);
//       if (userr != null) {
//         Navigator.pushNamed(context, 'Home');
//         // ...
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Invalid username or password'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('تسجيل'),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     labelText: 'اسم المستخدم',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value != null && value.isEmpty) {
//                       return 'ادخل اسم المستخدم';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _username = value!;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'كلمة السر',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value != null && value.isEmpty) {
//                       return 'ادخل كلمة السر';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _password = value!;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 TextButton(
//                   child: const Text('نسيت كلمة السر'),
//                   onPressed: () {},
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     _username = _usernameController.text;
//                     _password = _passwordController.text;
//                     Students? Data = await submitData(_username, _password);
//                     setState(() {
//                       _students = Data;
//                     });
//                     print(Data);
//                   },
//                   child: const Text('تسجيل'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'register');
//                   },
//                   child: const Text('مستخدم جديد'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduationproject2/TeacherScreen/TeacherHome.dart';
import 'package:graduationproject2/classes/Student.dart';
import 'package:graduationproject2/services/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/Teacher.dart';
import '../main.dart';
import '../services/Api.dart';
import '../services/loginuser.dart';

class LoginTeacher extends StatefulWidget {
  @override
  _LoginTeacherState createState() => _LoginTeacherState();
}

class _LoginTeacherState extends State<LoginTeacher> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Teacher? teacher;
  bool _isPasswordVisible = false;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<Teacher?> submitData(String username, String password) async {
    var response = await http.post(
        Uri.parse(
            'https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/teachers/'),
        body: {
          'username': _username,
          'password': _password,
        });
    var data = response.body;

    if (response.statusCode == 201) {
      String responseString = response.body;
      studentFromjson(responseString);
    } else {
      return null;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Teacher? userr = await login(_username, _password);
      if (userr != null) {
        Navigator.pushNamed(context, 'Home');
        // ...
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
    return null;
  }

  static Future<Teacher?> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedPassword = prefs.getString('password');

    if (storedUsername == username && storedPassword == password) {
      final name = prefs.getString('name');
      return Teacher(firstName: name!, username: username);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('تسجيل'),
              backgroundColor: Colors.teal,
            ),
            body: Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/images/background.png'),
                //     // Background image for the page
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Form(
                    key: _formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text('مرحبا في تطبيق ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium),
                                ),
                                SizedBox(height: 50.0),
                                // Add some spacing from the top
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: const InputDecoration(
                                    labelText: 'اسم المستخدم',
                                    border: OutlineInputBorder(),

                                    filled: true,
                                    prefixIcon: Icon(Icons
                                        .person), // Add an icon for the username field
                                  ),
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  // Use a custom font
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'ادخل اسم المستخدم';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _username = value!;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    labelText: 'كلمة السر',
                                    border: const OutlineInputBorder(),
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(_isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ), // Add an icon for the password field
                                  ),
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  // Use a custom font
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'ادخل كلمة السر';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _password = value!;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'teacherreg');
                                  },
                                  child: const Text(
                                    'مستخدم جديد',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    TeacherServices.loginTeacher(
                                            userName: _usernameController.text,
                                            passWord: _passwordController.text)
                                        .then((value) async {
                                      if (value == null) {
                                      } else {
                                        await sharedPreferences.setBool(
                                            'isLoginTeacher', true);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TeacherhomeScreen(
                                                teacher: value,
                                              ),
                                            ));
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .teal, // Use the app's primary color for the button
                                  ),
                                  child: const Text(
                                    'تسجيل',
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Use the app's primary text color
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'نسيت كلمة السر',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.teal),
                                    )),
                              ]),
                        ))))));
  }
}
