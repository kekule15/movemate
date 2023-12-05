import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movemate/providers/theme_provider.dart';
import 'package:movemate/utils/temporary_storage.dart';
import 'package:movemate/views/onboarding/splash.dart';

Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
 
  await LocalStorageManager.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeDataMode = ref.watch(themeDataProvider);
   
    return ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: (widget, child) => AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarBrightness: themeDataMode.isdarkTheme!
                      ? Brightness.dark
                      : Brightness.light,
                  statusBarIconBrightness: themeDataMode.isdarkTheme!
                      ? Brightness.light
                      : Brightness.dark,
                  statusBarColor: Colors.transparent),
              child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Movemate',
                  darkTheme: themeDataMode.isdarkTheme!
                      ? themeDataMode.darkTheme
                      : themeDataMode.lightTheme,
                  themeMode: ThemeMode.system,
                  theme: themeDataMode.isdarkTheme!
                      ? themeDataMode.darkTheme
                      : themeDataMode.lightTheme,
                  home: const SplashView(),
                ),
            ));
  }
}