import 'package:flutter/material.dart';
import 'package:graduationproject2/StudentScreen/Homeoage.dart';

import '../classes/Teacher.dart';
import '../classes/favaurite.dart';
import '../services/Api_helper.dart';

class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
 

  List<Favourite> currentFavourite = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RateAndFavourite.getFavourite(idStudent: 2).then((value) {
        currentFavourite = value;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المفضلة'), backgroundColor: Colors.teal),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: currentFavourite.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  width: 400,
                  height: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${currentFavourite[index].username}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '${currentFavourite[index].description}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
