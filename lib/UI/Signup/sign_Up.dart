import 'package:chat_app/UI/Home/home_screen.dart';
import 'package:chat_app/UI/Login/login_screen.dart';
import 'package:chat_app/UI/Signup/signupViewModel.dart';
import 'package:chat_app/base/base.dart';
import 'package:chat_app/dialogUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUP extends StatefulWidget {
  static const String routeName = "Signup";

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends Basestate<SignUP, SignupViewModel>
    implements SignupNavigator {
  bool isobsecured = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  SignupViewModel initViewModel() {
    return SignupViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {},
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Create Account"),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: fullNameController,
                      validator: (fullname) {
                        if (fullname!.isEmpty || fullname.trim().isEmpty) {
                          return "Please enter Full Name";
                        }
                      },
                      decoration: const InputDecoration(labelText: "Full Name"),
                    ),
                    TextFormField(
                      controller: userNameController,
                      validator: (username) {
                        if (username!.isEmpty || username.trim().isEmpty) {
                          return "Please enter User Name";
                        }
                      },
                      decoration: const InputDecoration(labelText: "User Name"),
                    ),
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
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              isobsecured = !isobsecured;
                              setState(() {});
                            },
                          )),
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: () {
                        createAccount();
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
                                "Sign Up",
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
                            context, LogIn.routeName, (route) => false);
                      },
                      child: const Text(
                        "Have an account?!",
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

  var auth = FirebaseAuth.instance;
  void createAccount() {
    if (formKey.currentState!.validate()) {
      viewModel.Signup(
          email: emailController.text,
          password: passwordController.text,
          fullname: fullNameController.text,
          username: userNameController.text);
    } else {
      return;
    }
  }
}
