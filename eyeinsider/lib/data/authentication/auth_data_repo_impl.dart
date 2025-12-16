import 'dart:developer';
import 'package:eyeinsider/domain/auth/auth_repo.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../service/DI/di_service.dart';

class AuthDataRepoImpl implements AuthRepo{
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<User?> signUpWithEmailPass({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      DI.i<NavigationService>().showToast(message: 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DI.i<NavigationService>().showToast(message: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
      return null; // Return null explicitly in case of an exception
    } catch (e) {
      print('Error: $e');
      return null; // Ensure function returns null on generic exceptions
    }
  }

  Future<UserCredential?> loginWithEmailPass({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential; // Return the UserCredential if successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DI.i<NavigationService>().showToast(message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        DI.i<NavigationService>().showToast(message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
      return null; // Return null explicitly when an exception is caught
    } catch (e) {
      print('Error: $e');
      return null; // Ensure function returns null on other errors
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log('Error on auth repo impl: $e');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
