import 'package:flutter/material.dart';

import 'StudentService.dart';
import 'data.dart';

// class Searchuser extends SearchDelegate{
//   student _userdata = student();
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//    return [
//      IconButton(onPressed:(){
//        query = '';
//      }, icon: Icon(Icons.close))
//    ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed:(){
//       Navigator.pop(context);
//     }, icon: Icon(Icons.arrow_back));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//
//       child: Column(
//         children: [
//           const SizedBox(height: 20.0,),
//           IconButton(onPressed:(){
//             showSearch(context: context, delegate:Searchuser());
//
//           }, icon:Icon(Icons.search)),
//           FutureBuilder <List<Data>>(
//               future: _userdata.fetchusers(),
//               builder: (context,snapshot) {
//                 var data = snapshot.data;
//                 if(snapshot.hasData){
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (context, index) {
//
//                     return Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Card(
//
//                         child: ListTile(
//                           title:Row(
//                               children: [
//                                 const SizedBox(height: 15.0,),
//                                 Container(
//                                   height: 200, width: 300, color: Colors.blue,
//                                   child: Center(
//                                     child: Text(
//                                         '${data?[index].email}'),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//
//                 );
//               }
//           ),
//         ],
//       ),
//     );
//
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//   return Center(
//     child: Text('search User'),
//   );
//   }
//
//}