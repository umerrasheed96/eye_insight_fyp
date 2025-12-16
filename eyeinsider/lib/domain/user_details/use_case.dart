

import 'package:eyeinsider/domain/user_details/user_details_repo.dart';

import '../../data/user_data/user_model.dart';


class UserDetails {
  final UserDetailsRepo repo;

  UserDetails({required this.repo});

  Future<bool> postUserDetails({required UserModel userModel , required  String uid }) async {
    try {
      await repo.postUserDetails(userModel: userModel , uid: uid);
      return true; // Indicate success
    } catch (e) {
      // Handle/log the error
      return false; // Indicate failure
    }
  }
}
