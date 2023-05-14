// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:graduationproject2/classes/Teacher.dart';
import 'package:graduationproject2/classes/favaurite.dart';

import '../classes/Student.dart';

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

  // Future<void> CreateStudent(Student student) async {

  // }
}

class TeacherServices {
  static Future<List<Teacher>> fetchTeachers() async {
    final response = await Dio().get("${APIHelper.baseUrl}teachers");

    return List<Teacher>.from(
        response.data["content"].map((e) => Teacher.fromJson(e)));
  }

  static Future<Teacher> getTeacherdata({required int idTeacher}) async {
    final response = await Dio().get("${APIHelper.baseUrl}students/$idTeacher");

    return Teacher.fromJson(response.data);
  }

  // Future<void> CreateTeacher(Teacher teacher) async {

  // }
}

class RateAndFavourite {
  static Future<void> postFavourite(
      {required int idStudent, required int idTeacher}) async {
    await Dio().post(
        "${APIHelper.baseUrl}students/$idStudent/favorite?teacherId=$idTeacher");
  }

  static Future deleteFavourite(
      {required int idStudent, required int idTeacher}) async {
    // https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/students/2/favorite?teacherId=2
    await Dio().delete(
        "https://mobiinstructor-production.up.railway.app/mobi-instructor/api/v1/students/$idStudent/favorite?teacherId=$idTeacher");
  }

  static Future<List<Favourite>> getFavourite({required int idStudent}) async {
    final response =
        await Dio().get("${APIHelper.baseUrl}students/$idStudent/favorite");

    return List<Favourite>.from(
        response.data.map((e) => Favourite.fromJson(e)));
  }

  // Future<void> CreateTeacher(Teacher teacher) async {

  // }
}
