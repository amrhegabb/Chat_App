import 'package:chat_app/UI/Home/home_screen.dart';
import 'package:chat_app/dialogUI.dart';
import 'package:flutter/material.dart';

abstract class BaseNanigator {
  void showLoadingN(String message);
  void showMessageN(String message);
  void hideLoadingN();
  void gohome();
}

class BaseViewModel<Nav extends BaseNanigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class Basestate<T extends StatefulWidget, Vm extends BaseViewModel>
    extends State<T> implements BaseNanigator {
  late Vm viewModel;

  @override
  void gohome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  void initState() {
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  Vm initViewModel();
  @override
  void hideLoadingN() {
    hideLoding(context);
  }

  @override
  void showLoadingN(String message) {
    ShowLoading(context, message);
  }

  @override
  void showMessageN(String message) {
    showMessage(context, message);
  }
}
