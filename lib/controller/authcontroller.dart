import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutchController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool islogin() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> loginwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await _auth.signInWithCredential(credential);
      Get.snackbar('Login Success', 'Login Success');
    } catch (error) {
      Get.snackbar('Login Failed', 'Login Failed');
    }
  }

  void logout() async {
    await _auth.signOut();
    await googleSignIn.signOut();
    Get.snackbar('Logout Success', 'Logout Success');
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Login Success', 'Login Success');
    } catch (error) {
      Get.snackbar('Login Failed', 'Login Failed');
    }
  }

  void register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Register Success', 'Register Success');
    } catch (error) {
      Get.snackbar('Register Failed', 'Register Failed');
    }
  }
}
