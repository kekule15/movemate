import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movemate/providers/calculate_provider.dart';
import 'package:movemate/providers/home_navigation_provider.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/widgets/custom_button.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class TotalEstimateView extends ConsumerStatefulWidget {
  const TotalEstimateView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TotalEstimateViewState();
}

class _TotalEstimateViewState extends ConsumerState<TotalEstimateView> {
  bool _isScaled = false;

  void _scaleButton() {
    setState(() {
      _isScaled = true;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isScaled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModel);
    var calculatorViewModel = ref.watch(calculateProviderViewModel);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Expanded(
              flex: 1,
              child: Center(
                child: ImageWidget(
                  asset: logoIcon,
                  height: 70.h,
                  width: 200.w,
                ),
              ),
            ),
            // SizedBox(height: 20.h),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ImageWidget(
                      asset: loadIcon,
                      height: 120.h,
                      width: 200.w,
                    ).animate().scaleXY(
                        alignment: Alignment.center,
                        curve: Curves.easeIn,
                        duration: 400.ms),
                  ),
                  SizedBox(height: 30.h),
                  SingleTextLineWidget(
                    text: 'Total Estimated Amount',
                    weight: FontWeight.w500,
                    color: AppColors.headerTextColor,
                    size: 20.sp,
                  ),
                  SizedBox(height: 20.h),
                  SingleTextLineWidget(
                    text: '\$${calculatorViewModel.counter.toString()} usd',
                    weight: FontWeight.bold,
                    color: AppColors.green,
                    size: 20.sp,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'This amount is estimated this will vary if you change your location or weight',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 12.sp),
                  ),
                  SizedBox(height: 30.h),
                  AnimatedScale(
                    scale: _isScaled ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: ActionCustomButton(
                        borderRadius: 14.r,
                        btnColor: AppColors.themeOrange,
                        title: "Back to home",
                        titleColor: AppColors.white,
                        isLoading: false,
                        onclick: () {
                          _scaleButton();
                          Future.delayed(const Duration(milliseconds: 400), () {
                            Get.back();
                            viewModel.changeIndex(0);
                          });
                        }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
