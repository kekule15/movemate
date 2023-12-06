import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/views/home/shipment/widgets/shipment_status_widget.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class ShipmentCardWidget extends ConsumerWidget {
  final String status;
  final String title;
  final String description;
  final String amount;
  final String date;

  const ShipmentCardWidget(
      {required this.status,
      required this.title,
      required this.description,
      required this.amount,
      required this.date,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 130.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShipmentStatusWidget(status: status),
            Expanded(
              child: ListTile(
                dense: true,
                isThreeLine: true,
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: SingleTextLineWidget(
                    text: title,
                    color: AppColors.headerTextColor,
                    weight: FontWeight.bold,
                    size: 14.sp,
                    height: 2,
                  ),
                ),
                subtitle: SingleTextLineWidget(
                  text:
                     description,
                  weight: FontWeight.w300,
                  size: 11.sp,
                ),
                trailing: SizedBox(
                    width: 90.w, child: const ImageWidget(asset: loadIcon)),
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Row(
              children: [
                SingleTextLineWidget(
                  text: "\$$amount USD",
                  color: AppColors.primary,
                  weight: FontWeight.bold,
                  size: 13.sp,
                ),
                SizedBox(
                  width: 4.w,
                ),
                SingleTextLineWidget(
                  text: "•",
                  color: AppColors.black,
                  weight: FontWeight.w400,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 4.w,
                ),
                SingleTextLineWidget(
                  text: date,
                  color: AppColors.black,
                  weight: FontWeight.w400,
                  size: 11.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
