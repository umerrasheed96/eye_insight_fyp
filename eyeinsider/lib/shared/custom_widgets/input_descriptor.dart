
import 'package:flutter/material.dart';

class InputDescriptor {
  late TextEditingController controller;
  late FocusNode focusNode;
  final String? label;
  final String? hintText;

  InputDescriptor({String? initialValue, this.label, this.hintText}) {
    controller = TextEditingController(text: initialValue);
    focusNode = FocusNode();
  }

  void clear() {
    controller.clear();
    focusNode.unfocus();
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  void setText(String vl) {
    controller.text = vl;
  }

  String get text => controller.text.trim();
}