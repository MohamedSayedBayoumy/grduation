// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduationproject2/TeacherScreen/TeacherHome.dart';
import 'package:graduationproject2/classes/Teacher.dart';
import 'package:graduationproject2/classes/favaurite.dart';
import 'package:graduationproject2/main.dart';

import '../classes/Material.dart';
import '../classes/Student.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static const String baseUrl =
      'https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/';
}

class StudentServices {
  static Future<List<Student>> fetchSudent() async {
    final response = await Dio().get("${APIHelper.baseUrl}students");

    return List<Student>.from(
        response.data["content"].map((e) => Student.fromJson(e)));
  }

  static Future<Student> getStudentbyid({required int idStudent}) async {
    final response = await Dio().get("${APIHelper.baseUrl}students/$idStudent");

    return Student.fromJson(response.data);
  }

  static Future<Student> loginStudent(
      {required String userName, required String passWord}) async {
    final response = await Dio().post("${APIHelper.baseUrl}login/student",
        queryParameters: {"username": userName, "password": passWord});

    return Student.fromJson(response.data);
  }

  static Future<int> registerStudent({
    required String userName,
    required String passWord,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/students'));
    request.body = json.encode({
      "firstName": firstName.toString(),
      "lastName": lastName.toString(),
      "gender": gender.toUpperCase(),
      "username": userName.toString(),
      "password": passWord.toString(),
      "email": email.toString(),
      "image": null
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final stringData = await response.stream.bytesToString();
    Map data = json.decode(stringData);

    if (data["id"] == null) {
    } else {
      await sharedPreferences.setBool('isLoginStudent', true);

      await sharedPreferences.setInt("CurrentStudent", data["id"]);
    }

    return data["id"] ?? 0;
  }
}

class TeacherServices {
  static Future<List<Teacher>> fetchTeachers() async {
    final response = await Dio().get("${APIHelper.baseUrl}teachers");

    return List<Teacher>.from(
        response.data["content"].map((e) => Teacher.fromJson(e)));
  }

  static Future<Teacher> getTeacherdata({required int idTeacher}) async {
    final response = await Dio().get("${APIHelper.baseUrl}teachers/$idTeacher");

    return Teacher.fromJson(response.data);
  }

  static Future<Teacher> loginTeacher(
      {required String userName, required String passWord}) async {
    final response = await Dio().post("${APIHelper.baseUrl}login/teacher",
        queryParameters: {"username": userName, "password": passWord});

    return Teacher.fromJson(response.data);
  }

  static Future<Teacher> regsiterTeacher(
      {required String? firstName,
      required String? lastName,
      required String? gender,
      required String? username,
      required String? password,
      required String? email,
      required String? city,
      required String? phoneNumber,
      required String? title,
      required dynamic pricePerHour,
      required dynamic pricePerCourse,
      required List<String>? teachingWays,
      required List<String>? targetedStudents,
      required}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/teachers'));
    request.body = json.encode({
      "firstName": firstName.toString(),
      "lastName": firstName.toString(),
      "gender": gender.toString().toUpperCase(),
      "username": username.toString(),
      "password": password.toString(),
      "email": email.toString(),
      "city": city.toString(),
      "phoneNumber": phoneNumber.toString(),
      "teachingWays": teachingWays,
      "targetedStudents": targetedStudents,
      "materials": [
        {
          "title": subject.toString(),
          "category": "SCHOOL",
          "pricePerHour": double.parse(pricePerHour),
          "pricePerCourse": double.parse(pricePerCourse),
          "stages": ["firstClass", "secondClass", "thirdClass"]
        }
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final stringData = await response.stream.bytesToString();
      dynamic data = json.decode(stringData);

      if (data["id"] == null) {
      } else {
        await sharedPreferences.setBool('isLoginTeacher', true);
      }
      print("Scusses");
      return Teacher.fromJson(data);
    } else {
      print(response.statusCode);
      return Teacher.fromJson({});
    }
  }
}

class RateAndFavourite {
  static Future<void> postFavourite(
      {required int idStudent, required int idTeacher}) async {
    await Dio().post(
        "${APIHelper.baseUrl}students/$idStudent/favorite?teacherId=$idTeacher");
  }

  static Future deleteFavourite(
      {required int idStudent, required int idTeacher}) async {
    await Dio().delete(
        "https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/students/$idStudent/favorite?teacherId=$idTeacher");
  }

  static Future<List<Favourite>> getFavourite({required int idStudent}) async {
    final response =
        await Dio().get("${APIHelper.baseUrl}students/$idStudent/favorite");

    return List<Favourite>.from(
        response.data.map((e) => Favourite.fromJson(e)));
  }
}
