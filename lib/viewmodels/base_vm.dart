
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseViewModel extends ChangeNotifier {
  final Ref ref;

  BaseViewModel(this.ref);


  bool validateAndSave(GlobalKey<FormState> key) {
    final form = key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

}
