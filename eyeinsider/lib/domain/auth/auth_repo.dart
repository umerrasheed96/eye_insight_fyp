

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<User?> signUpWithEmailPass({required String email, required String password});
  Future<UserCredential?> loginWithEmailPass({required String email, required String password}) ;
 Future<void> resetPassword({required String email});
 Future<void> signOut();
}