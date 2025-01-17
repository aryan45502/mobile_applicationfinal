import 'package:flutter/material.dart';
import 'package:wedplan/app/app.dart';
import 'package:wedplan/app/di/di.dart';
import 'package:wedplan/core/network/hive_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService.init();
  initDependencies();
  runApp(const MyApp());
}
