

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/domain/user_details/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class UserDetailDataSource {
//   final FirebaseFirestore firestore;

//   UserDetailDataSource({required this.firestore});


//   Future<List<UserEntity>> getUserDetails()async{
//     final snapshot =  await firestore.collection('users').get().;
//     return snapshot.docs.map((doc)=> UserModel.fromMap(doc.data()) ).toList();
 
//   }


//   Future<void> postUserDetails({required UserModel userModel}) async{
//     return firestore.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set(userModel.toMap());
//   }

//     Future<void> updateUserDetails({required String id ,required UserModel userModel} ) async{
//     return firestore.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).update(userModel.toMap());
//   }
// }


class UserDetailFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance ;

    // Fet

  // Future<List<UserEntity>> getUserDetails() async {
  //   try {
  //     final snapshot = await firestore.collection('users').get();
  //     return snapshot.docs
  //         .map((doc) => UserModel.fromMap(doc.data()))
  //         .toList();
  //   } catch (e) {
  //     debugPrint('Error fetching user details: $e');
  //     throw Exception('Failed to fetch user details');
  //   }
  // }
  Future <UserEntity> getUserDetails({required String uid}) async {
 try {
    final DocumentSnapshot snapshot = await firestore.collection('users').doc(uid).get();

    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not found');
    }
  } catch (e) {
    debugPrint('Error fetching user details: $e');
    
    throw Exception('Failed to fetch user details');
  }
  }

  Future<void> postUserDetails({required UserModel userModel ,required String uid}) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .set(userModel.toMap());
    } catch (e) {
      debugPrint('Error posting user details: $e');
      throw Exception('Failed to post user details');
    }
  }

  Future<void> updateUserDetails({
    required String id,
    required UserModel userModel,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(userModel.toMap());
    } catch (e) {
      debugPrint('Error updating user details: $e');
      throw Exception('Failed to update user details');
    }
  }
}

