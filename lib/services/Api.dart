import 'dart:convert';

import 'package:http/http.dart' as http;

final String apiUrl = 'https://random-data-api.com/api/v2/users?size=2&is_xml=true';
Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse('$apiUrl/data'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}

Students studentFromjson( String str) => Students.fromJson(json.decode(str));
String studenttojson(Students data) => json.encode(data.toJson());
class Students {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  Students({this.name, this.job, this.id, this.createdAt});

  Students.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

