import 'package:chat_app/UI/AddRoom/addRoomViewModel.dart';
import 'package:chat_app/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddRoom extends StatefulWidget {
  static const String routeName = "AddRoom";

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends Basestate<AddRoom, AddRoomViewModel>
    implements AddRoomNavigator {
  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
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
            title: const Text("Add Room"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              margin: EdgeInsets.all(25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              elevation: 12,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create New Room",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const Image(
                      image: AssetImage("assets/images/CRimage.png"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Room  Name",
                      ),
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Room  description",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
