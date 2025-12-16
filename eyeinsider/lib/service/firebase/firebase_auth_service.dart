import 'package:eyeinsider/service/DI/di_service.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _navService = DI.i<NavigationService>();

  User? get user => _auth.currentUser;

  String? _verificationID;
  int? _forceResendingToken;

  Future<void> get logout => _auth.signOut();

  Future<void> verifyPhoneNumber({
    required String phone,
    required void Function() codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    required void Function(FirebaseAuthException) verificationFailed,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (authCred) async {},
          verificationFailed: (e) {
            verificationFailed(e);
            _navService.showToast(message: e.message ?? 'Something went wrong');
          },
          codeSent: (String verificationID, int? resendingToken) {
            _verificationID = verificationID;
            _forceResendingToken = resendingToken;
            _navService.showToast(message: 'Check SMS for OTP');
            codeSent();
          },
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          forceResendingToken: _forceResendingToken);
    } catch (e) {
      DI.i<NavigationService>().showToast(message: 'Something went wrong');
    }
  }

  Future<UserCredential?> verifyCode(String smsCode) async {
    try {
      PhoneAuthCredential phoneCredential = PhoneAuthProvider.credential(
          verificationId: _verificationID!, smsCode: smsCode);
      final userCred = await _auth.signInWithCredential(phoneCredential);

      return userCred;
    } on FirebaseAuthException catch (e) {
      _navService.showToast(message: e.message ?? '');
      return null;
    } catch (e) {
      _navService.showToast(message: 'Something went wrong');
      return null;
    }
  }

  Future<UserCredential?> signinWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch (e) {
      _navService.showToast(message: e.message ?? '');
      return null;
    } catch (e) {
      _navService.showToast(message: 'Something went wrong');
      return null;
    }
  }

  Future<UserCredential?> loginWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch (e) {
      _navService.showToast(message: e.message ?? '');
      return null;
    } catch (e) {
      _navService.showToast(message: 'Something went wrong');
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final response = await _auth.sendPasswordResetEmail(email: email);
      return response;
    } on FirebaseAuthException catch (e) {
      _navService.showToast(message: e.message ?? '');
     
    } catch (e) {
      _navService.showToast(message: 'Something went wrong');
  
    }
  }

  Future<UserCredential?> loginWithCredentials(
      OAuthCredential credentials) async {
    try {
      final response = await _auth.signInWithCredential(credentials);
      return response;
    } on FirebaseAuthException catch (e) {
      _navService.showToast(message: e.message ?? '');
      return null;
    } catch (e) {
      _navService.showToast(message: 'Something went wrong');
      return null;
    }
  }
}