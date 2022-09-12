import 'package:flutter/material.dart';
import 'package:motobox/models/dummy.dart';

class Dummys with ChangeNotifier {
  List<Dummy> _users = [];

  List<Dummy> get users {
    return [..._users];
  }

  void addUsers() {
    //_users.add(value);
    notifyListeners();
  }
}
