import 'package:flutter/material.dart';
import 'sqflitepage.dart';
import 'preferences.dart';
import 'filesystem.dart';

void main() {
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
          ],
        ),
      ),
    );
  }
}
