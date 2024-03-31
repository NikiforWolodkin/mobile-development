import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'sqflitepage.dart';
import 'preferences.dart';
import 'filesystem.dart';
import 'filesystemexternal.dart';
import 'hivepage.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          children: [
            const ClothingPageSqfLite(),
            const ClothingPageSharedPreferences(),
            FileOperationPage(),
            FileOperationExternalPage(),
            const ClothingPageHive(),
          ],
        ),
      ),
    );
  }
}
