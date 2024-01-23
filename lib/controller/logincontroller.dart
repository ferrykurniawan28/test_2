import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/controller/authcontroller.dart';
import 'package:test_2/screens/home.dart';

class LoginController extends GetxController {
  var islogin = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _authC = Get.put(AutchController());

  void changeLogin() {
    islogin.value = !islogin.value;
  }

  void loginWithGoogle() {
    _authC.loginwithGoogle();
    Get.offAll(() => const Home());
  }

  void login() {
    if (formKey.currentState!.validate()) {
      _authC.login(email.text, password.text);
      Get.offAll(() => const Home());
    }
  }

  void register() {
    if (formKey.currentState!.validate()) {
      _authC.register(email.text, password.text);
      Get.offAll(() => const Home());
    }
  }
}
