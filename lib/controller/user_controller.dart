import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late String _username = "";
  void setUsername(String name) {
    _username = name;
    update();
  }

  String getUsername() {
    return _username;
  }
}
