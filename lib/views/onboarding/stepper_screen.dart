import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/app_info.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/views/home/navigation_page.dart';
import 'package:movemate/widgets/custom_button.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class StepperScreen extends ConsumerWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Expanded(
              flex: 2,
              child: Center(
                  child: ImageWidget(
                asset: logoIcon,
                height: 40.h,
                width: 200.w,
              ).animate().slideY(
                      curve: Curves.ease,
                      begin: -10,
                      end: 0,
                      duration: 800.ms)),
            ),
            // SizedBox(height: 20.h),
            Expanded(
              //flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Shipping \nmade simple.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 30.sp),
                  ).animate().fadeIn(curve: Curves.easeIn).then().slideX(),
                  SizedBox(height: 10.h),
                  Text(
                    'Experience the ease of efficient cargo shipping.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 12.sp),
                  ).animate().fadeIn(curve: Curves.easeIn).then().slideX(),
                ],
              ),
            ),
            ActionCustomButton(
                title: "Login",
                titleColor: AppColors.white,
                isLoading: false,
                onclick: () {
                  Get.to(() => const HomeNavigation());
                }),

            SizedBox(height: 10.h),
            ActionCustomButton(
                titleColor: AppColors.black,
                btnColor: AppColors.themeOrange.withOpacity(0.2),
                title: "Signup",
                isLoading: false,
                onclick: () {}),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                appVersion,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColors.gray),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
