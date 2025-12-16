

import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/domain/user_details/user_entity.dart';

abstract class UserDetailsRepo {


  Future<UserEntity> getUserDetail ({required String uid});

  Future<void> postUserDetails({required UserModel userModel , required  String uid });
  Future<void> updateUserDetails({required String id ,  required UserModel userModel,  } );
}