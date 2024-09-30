import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController cid = TextEditingController();
  TextEditingController password = TextEditingController();

  var hasCidError = false.obs;
}
