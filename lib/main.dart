import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ibrat_informatika/app.dart';
import 'package:ibrat_informatika/data/services/db_service.dart';
import 'package:ibrat_informatika/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DBService.open();
  runApp(const MyApp());
}
