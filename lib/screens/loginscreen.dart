import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/controller/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: loginC.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    (loginC.islogin.value) ? 'Login' : 'Register',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    loginC.loginWithGoogle();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text('Or'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: loginC.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: loginC.password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text((loginC.islogin.value)
                        ? 'Do not have an account?'
                        : 'Already have an account?'),
                  ),
                  TextButton(
                    onPressed: () {
                      loginC.changeLogin();
                    },
                    child: Obx(() =>
                        Text((loginC.islogin.value) ? 'Register' : 'Login')),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (loginC.islogin.value) {
                        loginC.login();
                      } else {
                        loginC.register();
                      }
                      // loginC.login();
                    },
                    child: Text((loginC.islogin.value) ? 'Login' : 'Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
