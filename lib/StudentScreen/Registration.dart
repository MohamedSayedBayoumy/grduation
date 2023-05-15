// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api, file_names, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:graduationproject2/services/api_helper.dart';

import '../main.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _gender = '';
  final _confirmpasswordController = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final gender = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8 && value.contains(regex)) {
      return 'invalid pasword';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value != password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateusername(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  bool _validateemail(String email) {
    if (email.isEmpty) {
      return false;
    }
    if (!email.contains('@')) {
      return false;
    }
    return true;
  }

  String? _validatename(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Registration Screen'),
            backgroundColor: Colors.teal,
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: firstname,
                      decoration: const InputDecoration(
                        labelText: 'الاسم',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validatename,
                      onSaved: (String? firstname) {},
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: lastname,
                      decoration: const InputDecoration(
                        labelText: 'الاسم التاني',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validatename,
                      onSaved: (String? lastname) {},
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: 'البريد الالكتروني',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (!_validateemail(value!)) {
                          return 'enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (String? email) {},
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        labelText: 'اسم المستخدم',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validateusername,
                      onSaved: (String? username) {},
                      /*validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },

                        */
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'كلمالسر',
                          border: OutlineInputBorder(),
                        ),
                        validator: _validatePassword,
                        onSaved: (String? password) {}
                        /*validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;


                        ,*/
                        ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'تاكيد كلمة السر',
                          border: OutlineInputBorder()),
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 10.0),
                    const Align(
                        alignment: Alignment.centerRight, child: Text('الجنس')),
                    Row(
                      children: [
                        Radio(
                          value: 'MALE',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            _gender = value!.toUpperCase();
                            print(_gender);
                            setState(() {});
                          },
                        ),
                        Text('ذكر'),
                        Radio(
                          value: 'FEMALE',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            _gender = value!.toUpperCase();
                            setState(() {});
                          },
                        ),
                        Text('انثى'),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        // Set the size here
                      ), // Use the app's primary color for the button

                      child: const Text(
                        'تسجيل',
                        style: TextStyle(
                            color: Colors
                                .white), // Use the app's primary text color
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _gender != "") {
                          StudentServices.registerStudent(
                            userName: username.text,
                            passWord: password.text,
                            email: email.text,
                            firstName: firstname.text,
                            gender: _gender,
                            lastName: lastname.text,
                          ).then((value) {
                            if (value == 0) {
                              print("object");
                            } else {
                              Navigator.pushNamed(context, "Home");
                            }
                          });
                        }
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text('login'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
