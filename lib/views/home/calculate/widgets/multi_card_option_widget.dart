import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';

class MultiCardOptionWidget extends ConsumerWidget {
  final bool isSelected;
  final Function onTap;
  final String title;

  const MultiCardOptionWidget(
      {required this.isSelected,
      required this.onTap,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color:
          isSelected ? AppColors.headerTextColor : Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(
              width: 1.w,
              color: isSelected
                  ? AppColors.headerTextColor
                  : AppColors.black.withOpacity(0.4))),
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
             mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: isSelected,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 14.w,
                  )),
                  SizedBox(width: 4.w,),
              Text(
                title,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineSmall
                    ?.copyWith(
                        fontSize: 12.sp,
                        color: isSelected
                            ? AppColors.white
                            : Theme.of(context)
                                .primaryTextTheme
                                .headlineSmall
                                ?.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
