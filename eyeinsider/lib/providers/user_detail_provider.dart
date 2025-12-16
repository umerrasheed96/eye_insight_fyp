import 'dart:developer';

import 'package:eyeinsider/data/user_data/user_data_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/domain/user_details/user_details_repo.dart';
import 'package:eyeinsider/domain/user_details/user_entity.dart';

class UserDetailsProvider extends ChangeNotifier {
  // DI
  final UserDetailsRepo userDetailsRepo;
  UserDetailsProvider({required this.userDetailsRepo});

  UserEntity? _userDetails;
  bool loading = false;
  String? _error;

  // Getters
  UserEntity? get userDetails => _userDetails;

  String? get error => _error;

  UserModel? _tempUserData;

  // Getter for temporary user data
  UserModel? get tempUserData => _tempUserData;

  // Method to set temporary user data
  void setTempUserData(UserModel userModel) {
    _tempUserData = userModel;
    notifyListeners();
  }

  // Method to fetch user details
  Future<void> fetchUserDetails({required String uid}) async {
    try {
      _setLoading(true);
      _userDetails = await userDetailsRepo.getUserDetail(uid: uid);
      _error = null; // Reset error state on success
    } catch (e) {
      _error = 'Failed to fetch user details: $e';
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  // Method to post user details
  Future<void> postUserDetails(
      {required UserModel userModel, String? uid}) async {
    try {
      _setLoading(true);
      loading = true;
      notifyListeners();

      if (uid == null) {
        throw Exception('UID is null while posting user details');
      }
      await userDetailsRepo.postUserDetails(userModel: userModel, uid: uid!);
      _error = null;
      // Optionally, refresh user details after posting
      await fetchUserDetails(uid: uid);
      return;
    } catch (e) {
      _error = 'Failed to post user details: $e';
      log('Erro on posting user detail model');
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  // Method to update user details
  Future<void> updateUserDetails(
      {required String uid,
      required String docId,
      required UserModel userModel}) async {
    _setLoading(true);
    try {
      await userDetailsRepo.updateUserDetails(id: docId, userModel: userModel);
      _error = null;
      // Optionally, refresh user details after updating
      await fetchUserDetails(uid: uid);
    } catch (e) {
      _error = 'Failed to update user details: $e';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
