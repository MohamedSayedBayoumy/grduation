import 'package:flutter/material.dart';
import 'package:graduationproject2/services/api_helper.dart';
import '../classes/Student.dart';
import 'package:http/http.dart' as http;





class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  // late String _firstname;
  // late String _lastname;
  // late String _email;
  // late String _username;
  // late String _password;
  // late String _phonenumber;
  String _gender = '';
  // final _emailController  = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _nameController = TextEditingController();
  // final _usernameController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _ismale = false;



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
    if(value.length<8 && value.contains(regex)){
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
  final StudentServices _studentServices = StudentServices();


  // Future RegistrationUser()  async{
  //   var APIURL = 'https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/student/';
  //
  //   //json maping user entered details
  //  // // List <Student> data =[
  //  //    'name':firstname.text + lastname.text,
  //  //    'email':email.text,
  //  //    'username':username.text,
  //  //    'password':password.text
  //  //  ];
  //   body: jsonEncode(<String, String>{
  //   'name':firstname.text + lastname.text,
  //   'email':email.text,
  //   'username':username.text,
  //   'password':password.text,
  //     'gender': 'FEMALE',
  //
  //
  //
  //   });
  //
  //   http.Response reponse = await http.post(APIURL as Uri);
  //
  //   var data = jsonDecode(reponse.body);
  //   print("DATA: ${data}");
  //
  // }



  @override
  Widget build(BuildContext context) {

        return Padding (
      padding: EdgeInsets.all(0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Registration Screen'),
            backgroundColor: Colors.teal,
          ),
          body:Form(
            key: _formKey,

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Flexible(
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
                        onSaved: (String ? firstname) {

                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: lastname,
                        decoration: const  InputDecoration(
                          labelText: 'الاسم التاني',
                          border: OutlineInputBorder(),
                        ),
                        validator: _validatename,
                        onSaved: (String ?lastname) {

                        },
                      ),
                      const  SizedBox(height: 10.0),
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
                        onSaved: (String ? email) {

                        },
                      ),
                     const SizedBox(height: 10.0),
                      TextFormField(
                        controller: username,
                        decoration: const InputDecoration(
                          labelText: 'اسم المستخدم',
                          border: OutlineInputBorder(),
                        ),

                        validator: _validateusername,
                        onSaved: (String ? username) {

                        },
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
                          onSaved: (String ? password) {

                          }
                        /*validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;


                        ,*/
                      ),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration:const  InputDecoration(
                            labelText: 'تاكيد كلمة السر',
                            border: OutlineInputBorder()
                        ),

                        validator: _validateConfirmPassword,
                      ),

                      const SizedBox(height: 10.0),
                      const Align( alignment: Alignment.centerRight,
                          child:   Text('الجنس')),
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
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .teal,
                           // Set the size here
                        ),// Use the app's primary color for the button

                        child: const Text(
                          'تسجيل',
                          style: TextStyle(color: Colors
                              .white), // Use the app's primary text color
                        ),
                        onPressed: ()  {
                          Student newStudent = Student(
                            firstName: firstname.text,
                            lastName: lastname.text,
                            email: email.text,
                            username: username.text,
                            password: password.text,
                            gender: _gender, // enum ['MALE', 'FEMALE']

                          );
                            if(_formKey.currentState!.validate())
                                {
                                  // _studentServices.CreateStudent(newStudent).then((_) {
                                  //   print("Successful");
                                  //   Navigator.pushNamed(context, 'Home');
                                  // }).catchError((error){
                                  //   print('Registration failed: $error');
                                  //   }
                                  // );
                                   }
                                },


                          // if (_formKey.currentState!.validate()) {
                          //   // Save the user's data
                          //    RegistrationUser();
                          //   print('succesfull');
                          //   _formKey.currentState!.save();
                          //   Student Data = Student();
                          //   Navigator.pushNamed(context, 'Home');
                          //
                          //   //Data.save();
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('User registered successfully'),
                          //   ));
                          // }
                      ),

                     TextButton( onPressed:(){
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
      ),
    );
  }
}
