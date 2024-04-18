import 'package:ibrat_informatika/data/models/course.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

sealed class LocalDataService {
  static Future<Course> getCourse() async {
    String filePath = 'assets/datas/data.json';
    File(filePath).exists().then((value) => print(value));
    final jsonString = await rootBundle.loadString(filePath);

    Map<String, dynamic> jsonData = json.decode(jsonString);
    return Course.fromJson(jsonData);
  }
}
