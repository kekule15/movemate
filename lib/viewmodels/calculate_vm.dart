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
}
