import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class ShipmentStatusWidget extends ConsumerWidget {
  final String status;
  const ShipmentStatusWidget({required this.status, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 25.h,
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: AppColors.gray.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              switch (status) {
                "pending" => Icons.history,
                "progress" => Icons.cached_outlined,
                "loading" => Icons.av_timer,
                "completed" => Icons.check_circle_outline_outlined,
                _ => Icons.cancel_outlined
              },
              color: switch (status) {
                "pending" => AppColors.themeOrange,
                "progress" => AppColors.green,
                "loading" => AppColors.lightBlueTheme,
                "completed" => AppColors.primary,
                _ => AppColors.red,
              },
              size: 14.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            SingleTextLineWidget(
              text: switch (status) {
                "pending" => "Pending",
                "progress" => "In-progress",
                "loading" => "Loading",
                "completed" => "Completed",
                _ => "Canceled"
              },
              color: switch (status) {
                "pending" => AppColors.themeOrange,
                "progress" => AppColors.green,
                "loading" => AppColors.lightBlueTheme,
                "completed" => AppColors.primary,
                _ => AppColors.red,
              },
              weight: FontWeight.w600,
              size: 11.sp,
            )
          ],
        ),
      ),
    );
  }
}
