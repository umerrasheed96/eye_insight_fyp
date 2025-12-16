import 'package:cloud_firestore/cloud_firestore.dart';

mixin FirebaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<ResponseGeneric> firebaseErrorHandling(
      Future<ResponseGeneric> Function() functionality) async {
    try {
      return await functionality();
    } catch (e) {
      // DI.i<NavigationService>().showToast(message: 'Something went wrong.');
      // showSnackBar(message: 'Something went wrong.');
      return ResponseGeneric(
          success: false, data: null, message: 'Something went wrong.');
    }
  }
}

class ResponseGeneric {
  dynamic data;
  int? responseCode;
  String? code;
  String? message;
  bool success;

  ResponseGeneric({
    this.data,
    this.responseCode,
    this.code,
    this.message,
    required this.success,
  });
}