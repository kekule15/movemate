
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movemate/viewmodels/home_vm.dart';

final homeViewModel =
    ChangeNotifierProvider.autoDispose<HomeViewModel>((ref) => HomeViewModel(ref));



    
final snackBarKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>(
    (ref) => GlobalKey<ScaffoldMessengerState>());
