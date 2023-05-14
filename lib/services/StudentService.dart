import 'dart:convert';

import 'package:graduationproject2/services/post.dart';
import 'package:http/http.dart' as http;
// post = json.decode(response.data).map<post>((dynamic post) =>
// post.fromJson(post)).toList();
// String ? responsebody;
// List jsonList = json.decode(responsebody!) as List;
//
// List myList = jsonList.map(
//         (jsonElement) => post.fromJson(jsonElement)
// ).toList();
//
//
//
//
// Future<post> fetchpost() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return post.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load post');
//   }
// }

Future<List<Post>> fetchpost() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data from API');
  }
}





