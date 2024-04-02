import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService authService;

  const HomePage({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: authService.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email!, // Display the user's email here
                    style: const TextStyle(fontSize: 18),
                  ),
                  // Add other widgets or functionality as needed
                ],
              ),
            ),
          );
        } else {
          // Error state
          return const Text('Error fetching user data');
        }
      },
    );
  }
}
