import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';

class NavCardWidget extends ConsumerWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  const NavCardWidget(
      {required this.title,
      required this.icon,
      required this.isActive,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: isActive
                  ? BorderSide(color: AppColors.primary, width: 2.w)
                  : BorderSide.none)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20.w,
            color: isActive ? AppColors.primary : AppColors.gray,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                fontSize: 10.sp,
                color: isActive
                    ? AppColors.primary
                    : Theme.of(context).primaryTextTheme.headlineMedium!.color),
          ),
        ],
      ),
    );
  }
}
