import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movemate/providers/home_navigation_provider.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/widgets/custom_button.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class TotalEstimateView extends ConsumerWidget {
  const TotalEstimateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModel);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Expanded(
              flex: 1,
              child: Center(
                child: ImageWidget(
                  asset: logoIcon,
                  height: 60.h,
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
                    ),
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
                    text: '\$1460 usd',
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
                  ActionCustomButton(
                      borderRadius: 14.r,
                      btnColor: AppColors.themeOrange,
                      title: "Back to home",
                      isLoading: false,
                      onclick: () {
                        Get.back();
                        viewModel.changeIndex(0);
                      }),
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
