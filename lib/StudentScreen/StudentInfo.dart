// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduationproject2/TeacherScreen/TeacherHome.dart';

import '../classes/Student.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({Key? key}) : super(key: key);

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}
Student ? student = Student(
  username: student!.username,
  firstName: student!.firstName,
  lastName: student!.lastName,
  email: student!.email,



) ;
bool _isEditing = false;
bool _isediting1 = false;
late String password;
late String gender;

late TextEditingController _nameController;
late TextEditingController _emailController;
late TextEditingController _usernameController;
class _StudentInfoState extends State<StudentInfo> {
  void onpressed() {
    if (_isEditing) {
      setState(() {
        _isEditing = false;
      });
    } else {
      setState(() {
        _isEditing = true;
      });
    }


  }

  void onpressedd() {
    if (_isediting1) {
      setState(() {
        _isediting1 = false;
      });
    } else {
      setState(() {
        _isediting1 = true;
      });
    }
  }
  @override
  void dispose() {

    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(backgroundColor: Colors.teal,
          title: Text('معلومات الحساب',style: TextStyle(fontSize: 20),),

        ),
        body:
      Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListView(children: <Widget>[
        Center(
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                    )),
              ),
              // IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: () {
              //     chooseImage("camera");
              //   },
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        _isediting1
            ? TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'name',
              hintText:name ,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onChanged: (value) {
              student!.firstName = value;
            })
            : Center(
          child: Text('الاسم : $name',style:TextStyle(fontSize: 25,),),
        ),
        const SizedBox(
          height: 20.0,
        ),
        _isediting1
            ? TextField(
            decoration: InputDecoration(
              labelText: 'email',
              hintText: email,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              email = value;
            })
            : Center(
          child: Text('البريد الالكتروني : $email', style:TextStyle(fontSize: 25,),),
        ),
        const SizedBox(
          height: 20.0,
        ),
        _isediting1
            ? TextField(
          decoration: InputDecoration(
            labelText: 'اسم المستخدم',
            hintText: username,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            username = value;
          },
        )
            : Center(
          child: Text('اسم المستخدم : $username', style:TextStyle(fontSize: 25,),),
        ),
        const SizedBox(
          height: 16.0,
        ),

        const SizedBox(
          height: 20.0,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors
                  .teal, // Use the app's primary color for the button
            ),
            onPressed: onpressedd,
            child: Text(_isediting1 ? 'حفظ' : 'تعديل', style: TextStyle(fontSize: 20),),
          ),
        ),
      ]
      ),
    ),
    )
    );
  }
}
