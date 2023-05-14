// //
// //
// //
// //
// //
// // // body: ListView.builder(
// // //     itemCount: _postdiasplay.length + 1,
// // //     itemBuilder: (context, index) {
// // //       if(_postdiasplay.isNotEmpty){
// // //         return Card(
// // //           child: Padding(
// // //             padding: EdgeInsets.all(10.0),
// // //             child: Column(
// // //               children: [
// // //                 Text('${_postdiasplay[index].id}'),
// // //               ],
// // //             ),
// // //           ),
// // //         );
// // //       }
// // //       else {
// // //         Text('No DATA FOUND ');
// // //       }
// // //
// // //     }
// // //       ),
// //
// // // class VideoApp extends StatefulWidget {
// // //
// // //   @override
// // //   _VideoAppState createState() => new _VideoAppState();
// // // }
// // //
// // // class _VideoAppState extends State<VideoApp> {
// // //   TextEditingController editingController = TextEditingController();
// // //
// // //   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
// // //   var items = <String>[];
// // //
// // //   @override
// // //   void initState() {
// // //     items.addAll(duplicateItems);
// // //     super.initState();
// // //   }
// // //
// // //   void filterSearchResults(String query) {
// // //     List<String> dummySearchList = <String>[];
// // //     dummySearchList.addAll(duplicateItems);
// // //     if(query.isNotEmpty) {
// // //       List<String> dummyListData = <String>[];
// // //       dummySearchList.forEach((item) {
// // //         if(item.contains(query)) {
// // //           dummyListData.add(item);
// // //         }
// // //       });
// // //       setState(() {
// // //         items.clear();
// // //         items.addAll(dummyListData);
// // //       });
// // //       return;
// // //     } else {
// // //       setState(() {
// // //         items.clear();
// // //         items.addAll(duplicateItems);
// // //       });
// // //     }
// // //
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //         child: Column(
// // //           children: <Widget>[
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: TextField(
// // //                 onChanged: (value) {
// // //                   filterSearchResults(value);
// // //                 },
// // //                 controller: editingController,
// // //                 decoration: InputDecoration(
// // //                     labelText: "Search",
// // //                     hintText: "Search",
// // //                     prefixIcon: Icon(Icons.search),
// // //                     border: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: ListView.builder(
// // //
// // //                 itemCount: items.length,
// // //                 itemBuilder: (context, index) {
// // //                   return ListTile(
// // //                     title: Container(
// // //                         height: 200, width: 100,
// // //                         color: Colors.blue,
// // //                         child: Center(child: Text('${items[index]}'))),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // class VideoApp extends StatefulWidget {
// // //   const VideoApp({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<VideoApp> createState() => _VideoAppState();
// // // }
// // //
// // // class _VideoAppState extends State<VideoApp> {
// // //
// // //   VideoPlayerController ?_VideoPlayerController;
// // //   File ?  _video ;
// // //   final picker = ImagePicker();
// // //
// // //   Future<void> _pickvideo() async {
// // //     final videopicked = await ImagePicker().pickVideo(source:ImageSource.gallery);
// // //     if(videopicked!= null){
// // //       _video = File(videopicked.path);
// // //     }
// // //     _video = File(videopicked!.path);
// // //     _VideoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_){
// // //       setState(() {});
// // //       _VideoPlayerController!.play();
// // //
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         body: Column(
// // //             children: [
// // //               _video == null?
// // //               const SizedBox(height: 10.0,) :AspectRatio(aspectRatio: _VideoPlayerController!.value.aspectRatio,
// // //                 child: VideoPlayer(_VideoPlayerController!),),
// // //               SizedBox(height: 20.0,),
// // //
// // //               ElevatedButton(onPressed:(){
// // //                 _pickvideo();
// // //               }, child:Text('pick a video')
// // //
// // //
// // //               )
// // //
// // //
// // //             ]
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// // // class WelcomeScreen extends StatelessWidget {
// // //   @override
// //  //Widget build(BuildContext context) {
// //     // return Scaffold(
// //     //   body: Padding(
// //     //     padding: EdgeInsets.all(30.0),
// //     //     child: Column(
// //     //       children: [
// //     //         Container(
// //     //           height: double.infinity,
// //     //           width: double.infinity,
// //     //
// //     //           // decoration: BoxDecoration(
// //     //           //   color: Colors.blue,
// //     //           //   borderRadius: BorderRadius.circular(100),
// //     //           // ),
// //     //           child: Center(
// //     //             child: Text(
// //     //               'Welcome to find tutor APP',
// //     //               style: TextStyle(
// //     //                 color: Colors.blue,
// //     //                 fontSize: 30,
// //     //                 fontWeight: FontWeight.bold,
// //     //               ),
// //     //             ),
// //     //           ),
// //     //         ),
// //     //         SizedBox(height: 32),
// //     //         Row(
// //     //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     //           children: [
// //     //             Container(
// //     //                 child: TextButton(
// //     //                   onPressed: (){
// //     //                     Navigator.pushNamed(context, 'register');
// //     //                   },
// //     //
// //     //                   child: Text('Student',
// //     //                     style: TextStyle(
// //     //                       color: Colors.black,
// //     //                     ),
// //     //                   ),
// //     //                 ),
// //     //                 height:150,
// //     //                 width:150,
// //     //                 color: Colors.blue
// //     //             ),
// //     //             SizedBox(width: 25.0,),
// //     //             Container(
// //     //               height: 150,
// //     //               width: 150,
// //     //               color: Colors.blue,
// //     //               child: TextButton(
// //     //                 onPressed: (){
// //     //                   Navigator.pushNamed(context, 'teacherreg');
// //     //                 },
// //     //
// //     //                 child: Text('Teacher',
// //     //                   style: TextStyle(
// //     //                     color: Colors.black,
// //     //                   ),
// //     //                 ),
// //     //               ),
// //     //             ),
// //     //           ],
// //     //         ),
// //     //       ],
// //     //     ),
// //     //   ),
// //     // );
// //  //  }
// //  // }
//
// import 'package:flutter/material.dart';
//
// // class MyBottomSheet extends StatefulWidget {
// //   const MyBottomSheet({Key? key}) : super(key: key);
// //
// //   @override
// //   _MyBottomSheetState createState() => _MyBottomSheetState();
// // }
// //
// // class _MyBottomSheetState extends State<MyBottomSheet> {
// //   final _formKey = GlobalKey<FormState>();
// //   int? _intValue1;
// //   int? _intValue2;
// //   String? _textValue1;
// //   String? _textValue2;
// //   String? _dropdownValue;
// //
// //   final List<String> _dropdownValues = [
// //     'Option 1',
// //     'Option 2',
// //     'Option 3',
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset : false,
// //       body: Form(
// //
// //       key: _formKey,
// //
// //       child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //       const Text(
// //       'Enter values:',
// //       style: TextStyle(fontSize: 20),
// //       ),
// //       const SizedBox(height: 16),
// //       TextFormField(
// //       keyboardType: TextInputType.number,
// //       decoration: InputDecoration(
// //       hintText: 'Enter an integer value',
// //       border: OutlineInputBorder(),
// //       ),
// //       validator: (value) {
// //       if (value != null && value.isNotEmpty) {
// //       if (int.tryParse(value) == null) {
// //       return 'Please enter a valid integer';
// //       }
// //       }
// //       return null;
// //       },
// //       onChanged: (value) {
// //       setState(() {
// //       _intValue1 = int.tryParse(value);
// //       });
// //       },
// //       ),
// //       const SizedBox(height: 16),
// //       TextFormField(
// //       keyboardType: TextInputType.text,
// //       decoration: InputDecoration(
// //       hintText: 'Enter a text value',
// //       border: OutlineInputBorder(),
// //       ),
// //       onChanged: (value) {
// //       setState(() {
// //       _textValue1 = value;
// //       });
// //       },
// //       ),
// //       const SizedBox(height: 16),
// //       TextFormField(
// //       keyboardType: TextInputType.number,
// //       decoration: InputDecoration(
// //       hintText: 'Enter an integer value',
// //       border: OutlineInputBorder(),
// //       ),
// //       validator: (value) {
// //       if (value != null && value.isNotEmpty) {
// //       if (int.tryParse(value) == null) {
// //       return 'Please enter a valid integer';
// //       }
// //       }
// //       return null;
// //       },
// //       onChanged: (value) {
// //       setState(() {
// //       _intValue2 = int.tryParse(value);
// //       });
// //       },
// //       ),
// //       const SizedBox(height: 16),
// //       TextFormField(
// //       keyboardType: TextInputType.text,
// //       decoration: InputDecoration(
// //       hintText: 'Enter a text value',
// //       border: OutlineInputBorder(),
// //       ),
// //       onChanged: (value) {
// //       setState(() {
// //       _textValue2 = value;
// //       });
// //       },
// //       ),
// //       const SizedBox(height: 16),
// //       DropdownButtonFormField<String>(
// //       value: _dropdownValue,
// //       onChanged: (value) {
// //       setState(() {
// //       _dropdownValue = value;
// //       });
// //       },
// //       items: _dropdownValues
// //           .map(
// //       (value) => DropdownMenuItem(
// //       value: value,
// //       child: Text(value),
// //       ),
// //       )
// //           .toList(),
// //       decoration: InputDecoration(
// //       hintText: 'Select a value',
// //       border: OutlineInputBorder(),
// //       ),
// //       ),
// //       const SizedBox(height: 16),
// //       ElevatedButton(
// //           child: Text('Apply'),
// //       onPressed: () {
// //       if (_formKey.currentState!.validate()) {
// //       print('Integer Value 1: $_intValue1');
// //       }
// //       }
// //       ),
// //    ]
// //       )
// //       )
// //       );
// //
// //   }
// // }
// //
// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:graduationproject2/Student.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../Api.dart';
// // import '../loginuser.dart';
// //
// // class Loginpr extends StatefulWidget {
// //   @override
// //   _LoginprState createState() => _LoginprState();
// // }
// //
// // class _LoginprState extends State<Loginpr> {
// //   final _formKey = GlobalKey<FormState>();
// //   late String _username;
// //   late String _password;
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   Students? _students;
// //
// //   @override
// //   void dispose() {
// //     _usernameController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }
// //
// //   Future<Students?> _submitData(String username, String password) async {
// //     final username = _usernameController.text;
// //     final password = _passwordController.text;
// //
// //     final response =
// //     await http.post(Uri.parse('https://reqres.in/api/users'), body: {
// //       'username': username,
// //       'password': password,
// //     });
// //
// //     if (response.statusCode == 201) {
// //       final responseBody = jsonDecode(response.body);
// //       final student = studentFromjson(responseBody);
// //       setState(() {
// //         _students = student;
// //       });
// //     }
// //
// //     if (_formKey.currentState!.validate()) {
// //       _formKey.currentState!.save();
// //
// //       final user = await login(username, password);
// //       if (user != null) {
// //         Navigator.pushNamed(context, 'Home');
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(
// //             content: Text('Invalid username or password'),
// //             duration: Duration(seconds: 3),
// //           ),
// //         );
// //       }
// //     }
// //   }
// //
// //   static Future<user?> login(String username, String password) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final storedUsername = prefs.getString('username');
// //     final storedPassword = prefs.getString('password');
// //
// //     if (storedUsername == username && storedPassword == password) {
// //       final name = prefs.getString('name');
// //       return user(name: name!, username: username);
// //     } else {
// //       return null;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Directionality(
// //         textDirection: TextDirection.rtl,
// //         child: Scaffold(
// //             appBar: AppBar(
// //               title: const Text('تسجيل'),
// //               backgroundColor: Colors.teal,
// //             ),
// //             body: Container(
// //                 decoration: BoxDecoration(
// //                   image: DecorationImage(
// //                     image: AssetImage('assets/images/background.png'),
// //                     // Background image for the page
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 child: Form(
// //                     key: _formKey,
// //                     child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               SizedBox(height: 50.0),
// //                               // Add some spacing from the top
// //                               TextFormField(
// //                                 controller: _usernameController,
// //                                 decoration: const InputDecoration(
// //                                   labelText: 'اسم المستخدم',
// //                                   border: OutlineInputBorder(),
// //                                   prefixIcon: Icon(Icons
// //                                       .person), // Add an icon for the username field
// //                                 ),
// //                                 style: TextStyle(fontFamily: 'Montserrat'),
// //                                 // Use a custom font
// //                                 validator: (value) {
// //                                   if (value != null && value.isEmpty) {
// //                                     return 'ادخل اسم المستخدم';
// //                                   }
// //                                   return null;
// //                                 },
// //                                 onSaved: (value) {
// //                                   _username = value!;
// //                                 },
// //                               ),
// //                               const SizedBox(height: 16.0),
// //                               TextFormField(
// //                                 controller: _passwordController,
// //                                 decoration: const InputDecoration(
// //                                   labelText: 'كلمة السر',
// //                                   border: OutlineInputBorder(),
// //                                   prefixIcon: Icon(Icons
// //                                       .lock), // Add an icon for the password field
// //                                 ),
// //                                 style: TextStyle(fontFamily: 'Montserrat'),
// //                                 // Use a custom font
// //                                 obscureText: true,
// //                                 validator: (value) {
// //                                   if (value != null && value.isEmpty) {
// //                                     return 'ادخل كلمة السر';
// //                                   }
// //                                   return null;
// //                                 },
// //                                 onSaved: (value) {
// //                                   _password = value!;
// //                                 },
// //                               ),
// //                               const SizedBox(height: 20.0),
// //                               TextButton(
// //                                 child: const Text(
// //                                   'نسيت كلمة السر',
// //                                   style: TextStyle(color: Colors
// //                                       .white), // Use the app's primary text color
// //                                 ),
// //                                 onPressed: () {},
// //                               ),
// //                               const SizedBox(height: 16.0),
// //                               ElevatedButton(
// //                                 onPressed: () async {
// //                                   _username = _usernameController.text;
// //                                   _password = _passwordController.text;
// //                                   Students? Data = await _submitData(
// //                                       _username, _password);
// //                                   setState(() {
// //                                     _students = Data;
// //                                   });
// //                                   print(Data);
// //                                 },
// //                                 child: const Text(
// //                                   'تسجيل',
// //                                   style: TextStyle(color: Colors
// //                                       .white), // Use the app's primary text color
// //                                 ),
// //                                 style: ElevatedButton.styleFrom(
// //                                   primary: Colors
// //                                       .teal, // Use the app's primary color for the button
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 16.0),
// //                               TextButton(
// //                                   onPressed: () {
// //                                     }, child: Text('نسيت كلمة السر', style: TextStyle(
// //                                 fontSize: 15.0,
// //                               ),)
// //                               ),
// //                             ]
// //                         )
// //                     )
// //                 )
// //             )
// //         )
// //     );
// //   }
// // }
//
// // class ProfileScreen extends StatefulWidget {
// //   @override
// //   _ProfileScreenState createState() => _ProfileScreenState();
// // }
// //
// // class _ProfileScreenState extends State<ProfileScreen> {
// //   bool _isEditing = false;
// //   String _name = 'John Doe';
// //   String _email = 'johndoe@example.com';
// //   String _bio = 'I am a Flutter developer.';
// //
// //   late TextEditingController _nameController;
// //   late TextEditingController _emailController;
// //   late TextEditingController _bioController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _nameController = TextEditingController(text: _name);
// //     _emailController = TextEditingController(text: _email);
// //     _bioController = TextEditingController(text: _bio);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _bioController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Profile'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.edit),
// //             onPressed: () {
// //               setState(() {
// //                 _isEditing = true;
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(
// //               child: CircleAvatar(
// //                 radius: 50.0,
// //                 backgroundImage: AssetImage('assets/profile.jpg'),
// //               ),
// //             ),
// //             SizedBox(height: 16.0),
// //             _isEditing
// //                 ? TextFormField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Name',
// //                 hintText: 'Enter your name',
// //                 border: OutlineInputBorder(),
// //               ),
// //             )
// //                 :  TextFormField(decoration: InputDecoration(
// //               border:  OutlineInputBorder(),
// //               labelText: 'name',
// //               hintText: _name,
// //             )
// //             ),
// //             SizedBox(height: 16.0),
// //             _isEditing
// //                 ? TextFormField(
// //               controller: _emailController,
// //               decoration: InputDecoration(
// //                 labelText: 'Email',
// //                 hintText: 'Enter your email address',
// //                 border: OutlineInputBorder(),
// //               ),
// //             )
// //                 : Text(
// //               _email,
// //               style: TextStyle(fontSize: 16.0),
// //             ),
// //             SizedBox(height: 16.0),
// //             _isEditing
// //                 ? TextFormField(
// //               controller: _bioController,
// //               maxLines: 5,
// //               decoration: InputDecoration(
// //                 labelText: 'Bio',
// //                 hintText: 'Enter a short bio about yourself',
// //                 border: OutlineInputBorder(),
// //               ),
// //             )
// //                 : Text(
// //               _bio,
// //               style: TextStyle(fontSize: 16.0),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         child: _isEditing
// //             ? null
// //             : Container(
// //           height: 56.0,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               FloatingActionButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _isEditing = true;
// //                   });
// //                 },
// //                 child: Icon(Icons.edit),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: _isEditing
// //           ? FloatingActionButton(
// //         onPressed: () {
// //           setState(() {
// //             _isEditing = false;
// //             _name = _nameController.text;
// //             _email = _emailController.text;
// //             _bio = _bioController.text;
// //           });
// //         },
// //         child: Icon(Icons.save),
// //       )
// //           : null,
// //     );
// //   }
// // }
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ImagePickerScreen> createState() => _ImagePickerScreenState();
// }
//
// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   File? selectedImage;
//   String base64Image = "";
//
//   Future<void> chooseImage(type) async {
//     // ignore: prefer_typing_uninitialized_variables
//     var image;
//     if (type == "camera") {
//       image = await ImagePicker()
//           .pickImage(source: ImageSource.camera, imageQuality: 10);
//     } else {
//       image = await ImagePicker()
//           .pickImage(source: ImageSource.gallery, imageQuality: 25);
//     }
//     if (image != null) {
//       setState(() {
//         selectedImage = File(image.path);
//         base64Image = base64Encode(selectedImage!.readAsBytesSync());
//         // won't have any error now
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("ImagePicker"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView(
//             children: [
//               CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.red,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8), // Border radius
//                   child: ClipOval(
//                       child: selectedImage != null
//                           ? Image.file(
//                         selectedImage!,
//                         fit: BoxFit.cover,
//                         height: 100,
//                         width: 100,
//                       )
//                           : Image.network(
//                         'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
//                         fit: BoxFit.cover,
//                         height: 100,
//                         width: 100,
//                       )),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   chooseImage("camera");
//                 },
//
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   chooseImage("Gallery");
//                 },
//                 child: const Text("Image From Gallery"),
//               ),
//             ],
//           ),
//         ));
//   }
// }
// // class SignInPage1 extends StatefulWidget {
// //   const SignInPage1({Key? key}) : super(key: key);
// //
// //   @override
// //   State<SignInPage1> createState() => _SignInPage1State();
// // }
// //
// // class _SignInPage1State extends State<SignInPage1> {
// //   bool _isPasswordVisible = false;
// //   bool _rememberMe = false;
// //
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Form(
// //         key: _formKey,
// //         child: Center(
// //           child: Container(
// //             padding: const EdgeInsets.all(32.0),
// //             constraints: const BoxConstraints(maxWidth: 350),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const FlutterLogo(size: 100),
// //                   _gap(),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                     child: Text(
// //                       "Welcome to Flutter!",
// //                       style: Theme.of(context).textTheme.headlineLarge
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 8.0),
// //                     child: Text(
// //                       "Enter your email and password to continue.",
// //                       style: Theme.of(context).textTheme.caption,
// //                       textAlign: TextAlign.center,
// //                     ),
// //                   ),
// //                   _gap(),
// //                   TextFormField(
// //                     validator: (value) {
// //                       // add email validation
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter some text';
// //                       }
// //
// //                       bool emailValid = RegExp(
// //                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
// //                           .hasMatch(value);
// //                       if (!emailValid) {
// //                         return 'Please enter a valid email';
// //                       }
// //
// //                       return null;
// //                     },
// //                     decoration: const InputDecoration(
// //                       labelText: 'Email',
// //                       hintText: 'Enter your email',
// //                       prefixIcon: Icon(Icons.email_outlined),
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   _gap(),
// //                   TextFormField(
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter some text';
// //                       }
// //
// //                       if (value.length < 6) {
// //                         return 'Password must be at least 6 characters';
// //                       }
// //                       return null;
// //                     },
// //                     obscureText: !_isPasswordVisible,
// //                     decoration: InputDecoration(
// //                         labelText: 'Password',
// //                         hintText: 'Enter your password',
// //                         prefixIcon: const Icon(Icons.lock_outline_rounded),
// //                         border: const OutlineInputBorder(),
// //                         suffixIcon: IconButton(
// //                           icon: Icon(_isPasswordVisible
// //                               ? Icons.visibility_off
// //                               : Icons.visibility),
// //                           onPressed: () {
// //                             setState(() {
// //                               _isPasswordVisible = !_isPasswordVisible;
// //                             });
// //                           },
// //                         )),
// //                   ),
// //                   _gap(),
// //                   CheckboxListTile(
// //                     value: _rememberMe,
// //                     onChanged: (value) {
// //                       if (value == null) return;
// //                       setState(() {
// //                         _rememberMe = value;
// //                       });
// //                     },
// //                     title: const Text('Remember me'),
// //                     controlAffinity: ListTileControlAffinity.leading,
// //                     dense: true,
// //                     contentPadding: const EdgeInsets.all(0),
// //                   ),
// //                   _gap(),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(4)),
// //                       ),
// //                       child: const Padding(
// //                         padding: EdgeInsets.all(10.0),
// //                         child: Text(
// //                           'Sign in',
// //                           style: TextStyle(
// //                               fontSize: 16, fontWeight: FontWeight.bold),
// //                         ),
// //                       ),
// //                       onPressed: () {
// //                         if (_formKey.currentState?.validate() ?? false) {
// //                           /// do something
// //                         }
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _gap() => const SizedBox(height: 16);
// // }
// // void _showFilterBottomSheet(BuildContext context) {
// //   showModalBottomSheet(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return Container(
// //         height: 300.0,
// //         child: Column(
// //           children: [
// //             SizedBox(height: 10.0),
// //             Text('Filter'),
// //             SizedBox(height: 20.0),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 labelText: 'Field 1',
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 labelText: 'Field 2',
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 labelText: 'Field 3',
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 labelText: 'Field 4',
// //               ),
// //             ),
// //             SizedBox(height: 10.0),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 labelText: 'Field 5',
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               child: Text('Apply'),
// //               onPressed: () {
// //                 //
// //               },
// //             ),
// //           ],
// //         ),
// //       );
// //     },
// //   );
// // }
import 'dart:convert';
import '../classes/Teacher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  // List<Teacher>Dataa = [];
  // Future<void> fetchFilterablData() async { //here fetch the new api
  //   final response = await http.get(Uri.parse('https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/teachers'));
  //   final List<dynamic> jsonData = json.decode(response.body);
  //   setState(() {
  //     Dataa = jsonData.map((json) => Teacher.fromJson(json)).toList();
  //     teachers = Dataa;
  //   });
  // }
  bool isLoading = false;
  List <Teacher> teacherdata = [];
  List<Teacher> data = [];
  Future <void> fetchTeachers() async{ //list of teachers
    final response = await  http.get(Uri.parse('https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/teachers'));
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map<String , dynamic>;
      setState(() {
        data = List.of(json['content']);
        teacherdata = data;
      });
    
    }
  }



  @override
  void initState() {
  fetchTeachers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher List'),
      ),
      body: ListView.builder(
        itemCount: teacherdata.length,
        itemBuilder: (context, index) {
          final teacher = teacherdata[index];
          return Container(
              color: Colors.grey,
            height: 200,
              decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),

              border: Border.all(color: const Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(8.0),
              ),

              child: Column(
               children: [
                 Text('${teacher.firstName}'),
             SizedBox(height: 20.0,),

             Text('${teacher.lastName}'),
            // Text(teacher.email ?? ''),
          ])

          );
        },
      ),
    );
  }
  }
