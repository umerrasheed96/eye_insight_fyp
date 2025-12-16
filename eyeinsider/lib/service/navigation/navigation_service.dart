
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/shared/bottomsheets/bottom_sheet_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;
  // BuildContext? get _context => _navigatorKey.currentContext!;

  Future<dynamic> showCustomDialog(Widget dialog) async {
    return await showDialog(
      
      context: _navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  Future<dynamic> showBottomsheet(
      {String? title, required Widget child, Widget? button}) async {
    return await showModalBottomSheet(
        backgroundColor: Colors.white,
        context: _navigatorKey.currentContext!,
        isScrollControlled: true,
        builder: (context) {
          return BottomsheetLayout(
            title: title,
            button: button,
            child: child,
          );
        });
  }

/*
  void showToast({required String message, bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(_context!).clearSnackBars();
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(_context!)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(_context!).showSnackBar(snackBar);
  }
*/
  void showToast({required String message, bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstant.primary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  navigateTo(Function(BuildContext context) navigationFunc) {
    navigationFunc(_navigatorKey.currentContext!);
  }


  navigateToScreen({required Widget nextScreen}) {
    Navigator.push(_navigatorKey.currentContext!,
        MaterialPageRoute(builder: (navigatorKey) => nextScreen));
  }
  pushReplacementToScreen({required Widget nextScreen}) {
    Navigator.pushReplacement(_navigatorKey.currentContext!,
        MaterialPageRoute(builder: (navigatorKey) => nextScreen));
  }
}
