import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_6/home_page.dart';

import 'auth_service.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final authService = AuthService();

  runApp(MainApp(authService: authService));
}


class MainApp extends StatelessWidget {
  final AuthService authService;

  const MainApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(authService: authService),
        '/register': (context) => RegistrationPage(authService: authService),
        '/home':(context) => HomePage(authService: authService),
      },
    );
  }
}
