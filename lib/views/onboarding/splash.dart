import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/views/onboarding/stepper_screen.dart';
import 'package:movemate/widgets/image_widgets.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation? time;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    time = Tween(begin: 0.0, end: 20.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Get.offAll(() => const StepperScreen());
        }
      }));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: ImageWidget(
            asset: splashLogoIcon,
            width: 200.w,
            height: 100.h,
          )
              .animate()
              .fadeIn(curve: Curves.ease, duration: 600.ms, delay: 200.ms)
              .then(delay: 800.ms)
              .slideY(
                  curve: Curves.easeOut,
                  begin: 0,
                  end: -10,
                  duration: 800.ms,
                  delay: 100.ms)
              .then(),
        ));
  }
}
