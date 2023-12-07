import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateViewModel extends ChangeNotifier {
  final Ref ref;
  CalculateViewModel(this.ref);

  List<String> categoryList = [];

  List<String> categoryListType = [
    "Documents",
    "Glass",
    "Liquid",
    "Food",
    "Electronic",
    "Product",
    "Others",
  ];

  void addCategoryType(String item) {
    categoryList.add(item);
    notifyListeners();
  }

  void removeCategoryType(String item) {
    categoryList.removeWhere((element) => item == element);
    notifyListeners();
  }

  int counter = 0;
  void startCounter(int end) {
    counter = 1200;
    notifyListeners();
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      //print('Counter is ${++counter}');
      counter++;
      notifyListeners();
      if (counter == end) {
        timer.cancel();
        notifyListeners();
      }
    });
  }
}
