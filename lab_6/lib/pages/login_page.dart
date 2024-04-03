import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class LoginPage extends StatelessWidget {
  final AuthService authService;

  const LoginPage({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("Enter your credentials to log in"),
            TextField(
              controller: emailController, // Use the email controller
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController, // Use the password controller
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle login logic here
                final email = emailController.text; // Get email from controller
                final password = passwordController.text; // Get password from controller

                User? user;
                try {
                  user = await authService.signInWithEmailAndPassword(email, password);
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

                if (user != null) {
                  // Navigate to the home page
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
