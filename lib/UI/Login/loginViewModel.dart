import 'package:chat_app/Database/database.dart';
import 'package:chat_app/base/base.dart';
import 'package:chat_app/sharedData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginNavigator extends BaseNanigator {}

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;

  void login(String email, String passsword) async {
    try {
      navigator?.showLoadingN("loading...");
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: passsword);
      var retriveduser = await Database.getuserbyid(credential.user!.uid);
      if (retriveduser != null) {
        navigator!.hideLoadingN();
        SharedData.user = retriveduser;
        navigator!.gohome();
      } else {
        navigator!.hideLoadingN();
        navigator!
            .showMessageN("Something went wrong or wrong user or password");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        navigator!.hideLoadingN();
        navigator!.showMessageN(
            "email or password may be not correct please try again");
      }
    }
  }
}
