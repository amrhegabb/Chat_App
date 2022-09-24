import 'package:chat_app/UI/AddRoom/addRoom.dart';
import 'package:chat_app/UI/Home/home_screen.dart';
import 'package:chat_app/UI/Login/login_screen.dart';
import 'package:chat_app/UI/Signup/sign_Up.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/myTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.ligthTheme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      routes: {
        SignUP.routeName: (context) => SignUP(),
        LogIn.routeName: (context) => LogIn(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddRoom.routeName: (context) => AddRoom(),
      },
    );
  }
}
