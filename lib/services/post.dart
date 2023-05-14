import 'package:shared_preferences/shared_preferences.dart';

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  double ? rating = 0;


  Post({this.userId, this.id, this.title, this.body, this.rating});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    rating = json['rating'];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['rating'] = this.rating;
    return data;
  }
}