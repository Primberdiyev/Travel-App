import 'package:flutter/material.dart';
import 'package:travel_app/utilities/statuses.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  Statuses _state = Statuses.initial;

  Statuses get state => _state;

  void updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
