import 'package:chat_app/UI/Home/home_screen.dart';
import 'package:chat_app/UI/Login/loginViewModel.dart';
import 'package:chat_app/UI/Signup/sign_Up.dart';
import 'package:chat_app/base/base.dart';
import 'package:chat_app/dialogUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  static const String routeName = "LogIN";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends Basestate<LogIn, LoginViewModel>
    implements LoginNavigator {
  bool isobsecured = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (email) {
                        if (email!.isEmpty ||
                            email.trim().isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                          return "Please enter Rigth Email Address";
                        }
                      },
                      decoration:
                          const InputDecoration(labelText: "Email Address"),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (password) {
                        if (password!.isEmpty ||
                            password.trim().isEmpty ||
                            password.length < 6) {
                          return "Password Must Be at least 6 characters ";
                        }
                      },
                      obscureText: isobsecured,
                      decoration: InputDecoration(
                          labelText: "password",
                          suffixIcon: InkWell(
                            child: isobsecured
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: () {
                              isobsecured = !isobsecured;
                              setState(() {});
                            },
                          )),
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: () {
                        SignIN();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 33,
                                color: Colors.white,
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, SignUP.routeName, (route) => false);
                      },
                      child: const Text(
                        "Create an account?!",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void SignIN() async {
    if (formKey.currentState!.validate()) {
      viewModel.login(emailController.text, passwordController.text);
    } else {
      return;
    }
  }
}
