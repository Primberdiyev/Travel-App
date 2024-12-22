import 'package:flutter/foundation.dart';

class ValueStateProvider with ChangeNotifier {
  bool isAgree = false;
  void setIsAgree() {
    isAgree = !isAgree;
    notifyListeners();
  }
}
