import 'package:chat_app/UI/AddRoom/addRoom.dart';
import 'package:chat_app/UI/Home/homeViewModel.dart';
import 'package:chat_app/base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends Basestate<HomeScreen, HomeViewModel>
    implements HomeNavigtor {
  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Container(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddRoom.routeName);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
