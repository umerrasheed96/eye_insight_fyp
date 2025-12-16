
import 'package:eyeinsider/service/DI/di_service.dart';
import 'package:eyeinsider/service/firebase/firebase_auth_service.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
enum AuthServiceType { facebook, apple, google }

class AuthenticationService {
  final FirebaseAuthServices _firebaseAuth = FirebaseAuthServices();
  final _navService = DI.i<NavigationService>();
  

  Future<void> signInWithEmailPassword(String email, String password) async {
    final userCred =
        await _firebaseAuth.signinWithEmailPassword(email, password);

    if (userCred != null) {
      _navService.navigateTo((context) {
        
      });
    }
  }

  Future<void> loginWithEmailPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      // final userCred = await _firebaseAuth.loginWithEmailPassword(
      //   email,
      //   password,
      // );

    } catch (e) {
      DI
          .i<NavigationService>()
          .showToast(message: "Login failed. Please try again. $e");
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.resetPassword(email).then((value) {
      _navService.navigateTo((context) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Forget Password'
                    ),
                content: const Text(
                  'Reset Email'
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok'
                      ))
                ],
              );
            });
      });
    });
  }

  logout() async {
    await _firebaseAuth.logout.then((value) {
      _navService.navigateTo((context) {
        

      });
    });

  }
}
