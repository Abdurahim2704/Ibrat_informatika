import 'dart:io';
import 'dart:convert';

import 'package:ibrat_informatika/data/models/course.dart';

void main() {
  String filePath = 'data.json';

  File file = File(filePath);
  String jsonString = file.readAsStringSync();

  Map<String, dynamic> jsonData = json.decode(jsonString);
  print(Course.fromJson(jsonData).chapters.length);
}
