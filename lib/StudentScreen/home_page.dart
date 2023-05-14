import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject2/classes/Teacher.dart';
import 'package:graduationproject2/classes/favaurite.dart';
import 'package:graduationproject2/services/Api_helper.dart';

import '../services/post.dart';

List<Post> filteredData = [];
List<Post> favouritelist = [];

void manageFav(int id) {
  final index = favouritelist.indexWhere((e) => e.id == id);
  if (index >= 0) {
    favouritelist.removeAt(index);
  } else {
    final item = filteredData.firstWhere((e) => e.id == id);

    favouritelist.add(item);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Teacher> teacher = [];
  List<Favourite> currentFavourite = [];
  List<bool> listOfNewItems = [];
  Color colorFavourite = Colors.white;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      TeacherServices.fetchTeachers().then((value) {
        teacher = value;
        setState(() {});
      });

      RateAndFavourite.getFavourite(idStudent: 2).then((value) {
        currentFavourite = value;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الصفحة الرئيسة'),
          backgroundColor: Colors.teal,
        ),
        body: SizedBox(
          child: Column(
            children: <Widget>[
              Row(children: [
                TextButton(
                  onPressed: () {
                    //fetchData();
                    Navigator.pushNamed(context, 'video');
                  },
                  child: Text('test'),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'الاسم الاول',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'الاسم التاني',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              if (int.tryParse(value) == null) {
                                                return 'Please enter a valid number';
                                              }
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'السعر للساعة', //السعر
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              if (int.tryParse(value) == null) {
                                                return 'Please enter a valid number';
                                              }
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            hintText: '', //السعر
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'subject',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'price',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          //applydata();
                                          Navigator.pop(
                                              context); // close bottom sheet
                                        },
                                        child: Text('تاكيد'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .teal, // Use the app's primary color for the button
                                        ),
                                      ),
                                      SizedBox(width: 16.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // close bottom sheet
                                        },
                                        child: Text('reset'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .teal, // Use the app's primary color for the button
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.search)),
              ]),
              Expanded(
                child: ListView.builder(
                  itemCount: teacher.length,
                  itemBuilder: (context, index) {
                    currentFavourite.where((e) => e.id == teacher[index].id);

                    return Container(
                      //constraints: const BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        border: Border.all(color: const Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8.0),

                      height: 200,

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${teacher[index].firstName} ${teacher[index].lastName}', // names of teachers
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${teacher[index].phoneNumber}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    teacher[index]
                                        .targetedStudents
                                        .toString()
                                        .replaceAll("]", "")
                                        .replaceAll("[", ""),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                onPressed: () {
                                  var currentIndexItem = currentFavourite
                                      .where((e) => teacher[index].id == e.id);

                                  print(currentIndexItem.isEmpty);
                                  if (currentIndexItem.isEmpty) {
                                    colorFavourite = Colors.red.shade900;
                                    RateAndFavourite.postFavourite(
                                        idStudent: 2,
                                        idTeacher: teacher[index].id!);
                                  } else {
                                    // here server have bugs ..
                                    colorFavourite = Colors.white;
                                    RateAndFavourite.deleteFavourite(
                                        idStudent: 2,
                                        idTeacher: teacher[index].id!);
                                  }
                                },
                                child:
                                    Icon(Icons.favorite, color: Colors.white),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'review',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 180,
                                    ),
                                    TextButton(
                                      onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: const Text('Rating'),
                                                content: const Text(
                                                    'AlertDialog description'),
                                                actions: [
                                                  RatingBar.builder(
                                                      initialRating: 0,
                                                      minRating: 0.5,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 4.0),
                                                      itemSize: 25.0,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                      onRatingUpdate: (rating) {
                                                        setState(() {});
                                                      }),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              )),
                                      child: const Text(
                                        'rate ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // ${filteredData[index].rating}',
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),
              ListTile(
                title: Text('الصفحة الرئيسية'),
                onTap: () {
                  Navigator.pushNamed(context, 'Home');
                  // Navigate to home screen
                },
              ),
              ListTile(
                title: Text('معلومات الحساب'),
                onTap: () {
                  Navigator.pushNamed(context, 'profileinfo');
                },
              ),
              ListTile(
                title: Text('المفضلة'),
                onTap: () {
                  Navigator.pushNamed(context, 'favourite');
                },
              ),
              ListTile(
                title: Text('تغيير كلمة السر '),
                onTap: () {},
              ),
              const SizedBox(height: 100.0),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// setState(() {
//   if (_filterdData.isFavorite ) {
//     _favoriteData.remove(_filterdData);
//      _filterdData.isFavorite = false;
//   } else {
//     _favoriteData.add(_filterdData);
//     _filterdData.isFavorite = true;
//   }
// });
