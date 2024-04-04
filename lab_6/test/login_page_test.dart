import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:lab_6/services/auth_service.dart';

@GenerateNiceMocks([MockSpec<AuthService>()])
import 'login_page_test.mocks.dart';

import 'package:lab_6/pages/login_page.dart';

void main() {
  final MockAuthService mockAuthService = MockAuthService();

  setUp(() {
    when(mockAuthService.signInWithEmailAndPassword('test@example.com', 'password123'))
      .thenAnswer((_) async => Future.value(null));
  });

  testWidgets('Enter email and password, tap login button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(authService: mockAuthService),
    ));

    // Find the TextFields and the ElevatedButton
    final Finder emailField = find.byType(TextField).at(0);
    final Finder passwordField = find.byType(TextField).at(1);
    final Finder loginButton = find.byType(ElevatedButton);

    // Enter text into the TextFields
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');

    // Tap the login button
    await tester.tap(loginButton);

    // Rebuild the widget after the state has changed
    await tester.pump();

    // Verify that the AuthService method was called
    verify(mockAuthService.signInWithEmailAndPassword('test@example.com', 'password123')).called(1);
  });

  testWidgets('PageView drag Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PageView(
          children: <Widget>[
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ],
        ),
      ),
    ));

    // Verify that the first page is displayed.
    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);

    // Drag to the left to go to the next page.
    await tester.drag(find.byType(PageView), Offset(-400.0, 0.0));
    await tester.pumpAndSettle();

    // Verify that the second page is displayed.
    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.green);
  });
}
