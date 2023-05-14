import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduationproject2/classes/Teacher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart ' as http;
class TeacherhomeScreen extends StatefulWidget {
  const TeacherhomeScreen({Key? key}) : super(key: key);

  @override
  State<TeacherhomeScreen> createState() => _TeacherhomeScreenState();
}

late TextEditingController _bioController;

bool _isEditing = false;
bool _isediting1 = false;
String name = 'Ahmad';
String email = 'Ahmad@mans1';
String username = 'ahmadmans';
late String password;
late String gender;
String city = 'Amman';
late String subject = 'رياضيات';
late int pricepercourse = 10;
late int priceperhour = 3;
int current = 0;

// late Teacher ourTeacher = new Teacher(name: "Ahmad Mansour", email: email, username: username, password: password,
//     gender: gender, city: city, subject: subject, pricepercourse: pricepercourse,
//     priceperhour: priceperhour);


// void fetchData() arabiasync {
//   final response = await http.get(Uri.parse('https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/students/1'));
//
//   if (response.statusCode == 200) {
//     // Successful response
//     final data = jsonDecode(response.body);
//     print("received data" + data);
//   } else {
//     // Error handling
//     print('Error: ${response.statusCode}');
//   }
// }


late TextEditingController _nameController;
late TextEditingController _emailController;
late TextEditingController _usernameController;
late TextEditingController _cityController;

class _TeacherhomeScreenState extends State<TeacherhomeScreen> {
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

  late File _image;
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // VideoPlayerController? _VideoPlayerController;
  // File? _video;
  // final picker = ImagePicker();
  //
  // Future<void> _pickvideo() async {
  //   try {
  //     final videopicked =
  //         await ImagePicker().pickVideo(source: ImageSource.gallery);
  //     if (videopicked != null) {
  //       _video = File(videopicked.path);
  //     }
  //
  //     _video = File(videopicked!.path);
  //     _VideoPlayerController = VideoPlayerController.file(_video!)
  //       ..initialize().then((_) {
  //         setState(() {});
  //         _VideoPlayerController!.play();
  //       });
  //   } catch (e) {
  //     print("Error picking video: $e");
  //   }
  // }

  // void _saveBio() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('bio', _bioController.text);
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Bio saved!'),
  //   ));
  // }

  @override
  void dispose() {
    _bioController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'المعلومات الشخصية',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'الحصص',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'الجزءالعريفي',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
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
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            chooseImage("camera");
                          },
                        ),
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
                            hintText: name,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onChanged: (value) {
                            name = value;
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
                  _isediting1
                      ? TextField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: city,
                            labelText: 'المحافظة',
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            city = value;
                          })
                      : Center(
                          child: Text('المحافظة : $city', style:TextStyle(fontSize: 25,),),
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
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView(children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  _isEditing
                      ? TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'المادة',
                            hintText: subject,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onChanged: (value) {
                            subject = value;
                          })
                      : Center(
                          child: Text(' المادة : $subject', style: TextStyle(fontSize: 25),),
                        ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _isEditing
                      ? TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'السعر',
                            hintText: priceperhour.toString(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onChanged: (value) {
                            int? newPrice = int.tryParse(value);
                            if (newPrice != null) {
                              priceperhour = newPrice; // update pricepercourse
                            }
                          },
                        )
                      : Center(
                          child: Text('السعر للساعة : $priceperhour',  style: TextStyle(fontSize: 25)),
                        ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _isEditing
                      ? TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: ' السعر للدورة',
                            hintText: pricepercourse.toString(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          onChanged: (value) {
                            int? newPrice = int.tryParse(
                                value); // convert input string to int
                            if (newPrice != null) {
                              pricepercourse =
                                  newPrice; // update pricepercourse
                            }
                          },
                        )
                      : Center(
                          child: Text('السعر للدورة : $pricepercourse',  style: TextStyle(fontSize: 25)),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .teal, // Use the app's primary color for the button
                      ),
                      onPressed: onpressed,
                      child: Text(_isEditing ? 'حفظ' : 'تعديل', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    // _video == null
                    //     ? const SizedBox(
                    //         height: 10.0,
                    //       )
                    //     : AspectRatio(
                    //         aspectRatio:
                    //             _VideoPlayerController!.value.aspectRatio,
                    //         child: VideoPlayer(_VideoPlayerController!),
                    //       ),
                    // const SizedBox(
                    //   height: 20.0,
                    // ),
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       _pickvideo();
                    //       //Navigator.pushNamed(context, 'video');
                    //     },
                       // child: const Text('pick a video')),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter a short bio about yourself',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
