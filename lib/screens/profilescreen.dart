import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/controller/profilecontroller.dart';
import 'package:test_2/screens/loginscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  if (profileC.islogin.value) {
                    profileC.islogin.value = false;
                  } else {
                    Get.to(() => const LoginScreen());
                  }
                },
                icon: Icon(
                  (profileC.islogin.value) ? Icons.logout : Icons.login,
                ),
              )),
        ],
      ),
      body: Obx(() {
        if (profileC.islogin.value) {
          return const Center(
            child: Text('Profile'),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You are not login yet!'),
                TextButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
