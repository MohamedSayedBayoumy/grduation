import 'package:flutter/material.dart';
import 'package:graduationproject2/classes/Teacher.dart';
import '../classes/Student.dart';


class RegistrationTeacher extends StatefulWidget {
  @override
  _RegistrationTeacherState createState() => _RegistrationTeacherState();
}

class _RegistrationTeacherState extends State<RegistrationTeacher> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _username;
  late String _password;
  late String _phonenumber;
  String _gender = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _phonenumberController= TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateusername(String? value){
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

  String? _validatename(String? value){
    if (value != null && value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  String? _validatephone(String? value){
    if (value != null && value.isEmpty) {
      return 'Please enter your phonenumber';
    }
    if(value!.length < 10){
      return 'الرقم غير صحيح';
    }
    return null;
  }





  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.all(0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('مستخدم جديد', style: TextStyle(fontSize:30,),),
            backgroundColor: Colors.teal,
          ),
          body:Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validatename,
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'البريد الالكتروني',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (!_validateemail(value!)) {
                        return 'enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      border: OutlineInputBorder(),
                    ),

                    validator: _validateusername,
                    onSaved: (value) {
                      _username = value!;
                    },



                  ),
                  SizedBox(height: 16.0,),

                  TextFormField(
                      controller: _phonenumberController,
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validatephone,
                      onSaved: (value) {
                        _phonenumber = value!;
                      }

                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'كلمالسر',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validatePassword,
                      onSaved: (value) {
                        _password = value!;
                      }

                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'تاكيد كلمة السر',
                        border: OutlineInputBorder()
                    ),

                    validator: _validateConfirmPassword,
                  ),

                  const SizedBox(height: 20.0),
                  Text('الجنس'),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 'male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value! as String;
                          });
                        },
                      ),
                      Text('ذكر'),
                      Radio(
                        value: 'female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value! as String;
                          });
                        },
                      ),
                      Text('انثى'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(


                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .teal, // Use the app's primary color for the button
                      ),

                    child: const  Text('تابع',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Save the user's data
                        _formKey.currentState!.save();
                        // final user = Student(
                        //   name: _name,
                        //   email: _email,
                        //   username: _username,
                        //   password: _password,
                        //   gender: _gender,
                        // );
                        final user = Teacher();


                       // user.save();
                        Navigator.pushNamed(context, 'teacherreg2');

                      }
                    },
                  ),



                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
