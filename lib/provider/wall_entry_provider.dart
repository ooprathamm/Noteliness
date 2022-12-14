import 'package:flutter/material.dart';

class wall_entry_provider with ChangeNotifier{
  late String _id;
  late String _title;

  //getters:
  String get getId => _id;
  String get getTitle => _title;

  //setters:
  void changeProductTitle(String val) {
    _title = val;
    notifyListeners();
  }

}