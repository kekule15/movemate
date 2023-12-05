
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movemate/style/theme.dart';

final themeDataProvider = ChangeNotifierProvider<ThemeProvider>(
    (ref) => ThemeProvider());
