import 'package:flutter/material.dart';

class FoodDataProvider with ChangeNotifier {
  bool isDeliverySelected = true;
  bool isPack = false;
  bool isDineIn = false;
  bool selectedMenuisLunch = true;

  void toggleSelectedMenuIsLunch(bool value) {
    selectedMenuisLunch = value;
    notifyListeners(); 
  }

  void toggleDeliverySelected(bool value) {
    isDeliverySelected = value;
    notifyListeners(); 
  }

  void togglePack(bool value) {
    isPack = value;
    notifyListeners(); 
  }

  void toggleDineIn(bool value) {
    isDineIn = value;
    notifyListeners(); 
  }
}
