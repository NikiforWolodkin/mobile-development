import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<FirebaseAuth>()])
@GenerateNiceMocks([MockSpec<UserCredential>()])
@GenerateNiceMocks([MockSpec<User>()])
import 'auth_service_test.mocks.dart';

import 'package:lab_6/services/auth_service.dart';

void main() {
  late MockFirebaseAuth mockAuth;
  late AuthService authService;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    authService = AuthService(auth: mockAuth);
  });

  test('Sign in with email and password', () async {
    when(mockAuth.signInWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => mockUserCredential);

    when(mockUserCredential.user)
        .thenAnswer((_) => MockUser());

    final user = await authService.signInWithEmailAndPassword('test@test.com', 'password');

    expect(user, isNotNull);
    verify(mockAuth.signInWithEmailAndPassword(email: 'test@test.com', password: 'password')).called(1);
  });

  // Add more tests for registerWithEmailAndPassword and getCurrentUser
}
