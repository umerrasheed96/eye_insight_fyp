import 'dart:developer';

import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/domain/auth/auth_repo.dart';
import 'package:eyeinsider/providers/user_detail_provider.dart';
import 'package:eyeinsider/service/DI/di_service.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:eyeinsider/views/navigator_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider2 extends ChangeNotifier {
  final AuthRepo repo;

  AuthProvider2({required this.repo});

  bool loading = false;

  final _navService = DI.i<NavigationService>();

  Future<User?> signUpWithEmailPass(
      {required String email,
      required String password,
      required UserModel userModel}) async {
    try {
      loading = true;
      notifyListeners();
      final User? user =
          await repo.signUpWithEmailPass(email: email, password: password);
      log('User retrieved: ${user?.uid}, ${user?.email}');
      if (user != null) {
        log('User ID ${user.uid}');

        UserModel userDetailModel = userModel;
        userDetailModel = userDetailModel.copyWith(
            uid: user.uid, email: user.email, imageUrlPath: 'No Image');
        await DI
            .i<UserDetailsProvider>()
            .postUserDetails(userModel: userDetailModel, uid: user.uid);

        _navService.pushReplacementToScreen(nextScreen: HomeScreen());
        log('User created successfully');
      }
      return user;
    } catch (e) {
      _navService.showToast(message: 'Error creating account');
      log('Error on auth provider $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<UserCredential?> loginWithEmailPass(
      {required String email, required String password}) async {
    try {
      loading = true;
      notifyListeners();

      final userCredential =
          await repo.loginWithEmailPass(email: email, password: password);

      return userCredential;
    } catch (e) {
      _navService.showToast(message: 'Error on login');
      log('Error on auth provider $e');
      return null;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      loading = true;
      notifyListeners();

      await repo.resetPassword(email: email);
    } catch (e) {
      log('Error o n sign out $e');
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      loading = true;
      notifyListeners();

      await repo.signOut();
    } catch (e) {
      log('Error on sign out $e');
    } finally {
      loading = true;
      notifyListeners();
    }
  }
}
