import 'package:chat_app/Database/database.dart';
import 'package:chat_app/Model/my_user.dart';
import 'package:chat_app/base/base.dart';
import 'package:chat_app/sharedData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class SignupNavigator extends BaseNanigator {}

class SignupViewModel extends BaseViewModel<SignupNavigator> {
  var auth = FirebaseAuth.instance;
  void Signup({
    required String email,
    required String password,
    required String fullname,
    required String username,
  }) async {
    try {
      navigator?.showLoadingN("loading...");
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Myuser newuser = Myuser(
          email: email,
          id: credential.user?.uid,
          fullname: fullname,
          username: username);
      var inserteduser = await Database.insertuser(newuser);
      if (inserteduser != null) {
        navigator!.hideLoadingN();
        SharedData.user = inserteduser;
        navigator?.gohome();
      } else {
        navigator!.hideLoadingN();
        navigator!.showMessageN("some thing went wrong please Try Again");
      }
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoadingN();
      navigator?.showMessageN(e.toString());
    }
  }
}
