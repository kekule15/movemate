import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movemate/viewmodels/calculate_vm.dart';

final calculateProviderViewModel =
    ChangeNotifierProvider<CalculateViewModel>((ref) => CalculateViewModel(ref));