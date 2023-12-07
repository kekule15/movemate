import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/svgs.dart';
import 'package:movemate/views/home/navigation_page.dart';
import 'package:movemate/widgets/customfield.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

FocusNode myFocusNode = FocusNode();

class SearchScreenView extends ConsumerStatefulWidget {
  const SearchScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchScreenViewState();
}

class _SearchScreenViewState extends ConsumerState<SearchScreenView> {
  Future<bool> onBackPressed() {
    Get.offAll(() => const HomeNavigation());
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: Stack(
          children: [
            headerWidget(),
            Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: bodyWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 110.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                InkWell(
                        onTap: () {
                          // Get.back();
                          Get.offAll(() => const HomeNavigation());
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ))
                    .animate()
                    .slide(
                        curve: Curves.easeIn,
                        duration: 600.ms,
                        begin: const Offset(-2, 0)),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: CustomField(
                    autoFocus: true,
                    focusNode: myFocusNode,
                    borderRadius: 20.r,
                    pIcon: Icon(
                      Icons.search,
                      size: 18.w,
                    ),
                    hint: "Enter the receipt number ...",
                    sIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: const BoxDecoration(
                            color: AppColors.themeOrange,
                            shape: BoxShape.circle),
                        child: RotatedBox(
                          quarterTurns: 45,
                          child: Icon(
                            Icons.flip,
                            color: AppColors.white,
                            size: 13.w,
                          ),
                        ),
                      ),
                    ),
                  ).animate().scaleX(
                      alignment: Alignment.topLeft,
                      curve: Curves.ease,
                      delay: 100.ms,
                      duration: 200.ms),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      height: 270.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          children: [
            searchedData(
                title: "Summer linen jacket",
                receiptNumber: "#NEJ20089934122231",
                from: "Barcelona",
                destination: "Paris"),
            Divider(
              color: AppColors.gray4.withOpacity(0.2),
            ),
            searchedData(
                title: "Tapered - fit jeans AW",
                receiptNumber: "#NEJ20089934122231",
                from: "Colombia",
                destination: "Paris"),
            Divider(
              color: AppColors.gray4.withOpacity(0.2),
            ),
            searchedData(
                title: "Macbook pro M2",
                receiptNumber: "#NEJ20089934122231",
                from: "Paris",
                destination: "Morocco"),
            Divider(
              color: AppColors.gray4.withOpacity(0.2),
            ),
            searchedData(
                title: "Office setup desk",
                receiptNumber: "#NEJ20089934122231",
                from: "France",
                destination: "Germany")
          ],
        ),
      ),
    ).animate().slideY(
        curve: Curves.ease, duration: 400.ms, begin: 10, end: 0, delay: 100.ms);
  }

  Widget searchedData(
      {required String title,
      required String receiptNumber,
      required String from,
      required String destination}) {
    return ListTile(
      dense: true,
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 13.r,
        backgroundColor: AppColors.primary,
        child: Center(
          child: SvgImage(
            asset: packageIcon,
            color: AppColors.white,
            width: 15.w,
            height: 15.w,
          ),
        ),
      ),
      title: SingleTextLineWidget(
        text: title,
        weight: FontWeight.bold,
        size: 13.sp,
      ),
      subtitle: Row(
        children: [
          SingleTextLineWidget(
            text: "$receiptNumber . $from ",
            size: 10.sp,
          ),
          SizedBox(
            width: 3.w,
          ),
          Icon(
            Icons.arrow_forward,
            size: 10.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          SingleTextLineWidget(
            text: destination,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}
