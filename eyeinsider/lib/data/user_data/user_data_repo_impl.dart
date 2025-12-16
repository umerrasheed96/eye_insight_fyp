import 'package:eyeinsider/data/user_data/data_source/user_detail_data_source.dart';
import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/domain/user_details/user_details_repo.dart';
import 'package:eyeinsider/domain/user_details/user_entity.dart';


class UserDetailsRepoImpl implements UserDetailsRepo {

final UserDetailFirebaseDataSource dataSource;

  UserDetailsRepoImpl({required this.dataSource});

  


  @override
  Future<UserEntity> getUserDetail({required String uid}) async {
    try {
      return await dataSource.getUserDetails(uid : uid);
    } catch (e) {
      throw Exception('Repository: Failed to get user details');
    }
  }

  @override
  Future<void> postUserDetails({required UserModel userModel , required  String uid }) async {
    try {
      await dataSource.postUserDetails(userModel: userModel, uid: uid);
    } catch (e) {
      throw Exception('Repository: Failed to post user details');
    }
  }

  @override
  Future<void> updateUserDetails({required String id, required UserModel userModel}) async {
    try {
      await dataSource.updateUserDetails(id: id, userModel: userModel);
    } catch (e) {
      throw Exception('Repository: Failed to update user details');
    }
  }
}
