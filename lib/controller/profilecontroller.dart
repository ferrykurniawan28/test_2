import 'package:get/get.dart';
import 'package:test_2/controller/authcontroller.dart';

class ProfileController extends GetxController {
  var islogin = false.obs;
  final _authC = Get.put(AutchController());

  @override
  void onInit() {
    islogin.value = _authC.islogin();
    super.onInit();
  }
}
