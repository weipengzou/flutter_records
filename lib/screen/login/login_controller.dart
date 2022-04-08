import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final isLogin = false.obs;
  final account = ''.obs;
  final password = ''.obs;

  changeAccount(String val) => account.value = val;

  changePassword(String val) => password.value = val;

  registration() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!",
      );
      print('registration');
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('catch');
      print(e);
    }
  }

  signIn() async {
    print('sign');
    return;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!",
      );
      print('---------------------');
      var currentUser = FirebaseAuth.instance.currentUser;

      print('start');
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${currentUser?.uid}");
      await ref.set({
        "records": [
          {
            "title": 'welcome to Records',
            "content": "default content",
            "createTime": DateTime.now().millisecondsSinceEpoch,
            "updateTime": DateTime.now().millisecondsSinceEpoch,
          }
        ]
      });
      print('over');
      print('---------------------');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          content: const Text('No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          content: const Text('Wrong password provided for that user.'),
        );
      }
    }
  }
}
