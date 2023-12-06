import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/utils/svgs.dart';
import 'package:movemate/widgets/customfield.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          headerWidget(),
          Padding(
            padding: EdgeInsets.only(top: 201.h),
            child: bodyWidget(),
          ),
        ],
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 200.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w - 10),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.white,
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.near_me_rounded,
                    color: AppColors.white.withOpacity(0.5),
                    size: 13.w,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text(
                    "Your location",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium
                        ?.copyWith(
                            color: AppColors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w200),
                  )
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    "Augustus Onyekachi",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: AppColors.white,
                    size: 13.w,
                  ),
                ],
              ),
              trailing: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.white,
                child: const Center(
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomField(
              borderRadius: 20.r,
              pIcon: Icon(
                Icons.search,
                size: 18.w,
              ),
              headtext: "Enter the receipt number ...",
              sIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(
                      color: AppColors.themeOrange, shape: BoxShape.circle),
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
            )
          ],
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return ListView(
      children: [
        SizedBox(
          height: 0.h,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w - 10),
          child: SingleTextLineWidget(
            text: "Tracking",
            size: 14.sp,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w - 10),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 1.w,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const SingleTextLineWidget(text: "Shipment Number"),
                    subtitle: SingleTextLineWidget(
                      text: "NEJ20089934122231",
                      weight: FontWeight.bold,
                      size: 13.sp,
                      height: 2,
                    ),
                    trailing: const ImageWidget(
                      asset: tractorIcon,
                    ),
                  ),
                  Divider(
                    color: AppColors.gray.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: trackingWidget(
                              hasExtra: false,
                              title: "Sender",
                              subtitle: "Atlanta, 5243",
                              hasLeadingWidget: true,
                              leadingIcon: sendIcon,
                              bgColor: AppColors.themeOrange)),
                      Expanded(
                          child: trackingWidget(
                              hasExtra: true,
                              title: "Time",
                              subtitle: "2 day -3 days",
                              hasLeadingWidget: false,
                              leadingIcon: '',
                              bgColor: Colors.transparent))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: trackingWidget(
                              hasExtra: false,
                              title: "Receiver",
                              subtitle: "Chicago, 6342",
                              hasLeadingWidget: true,
                              leadingIcon: recieveIcon,
                              bgColor: AppColors.green)),
                      Expanded(
                          child: trackingWidget(
                              hasExtra: false,
                              title: "Status",
                              subtitle: "Waiting to collect",
                              hasLeadingWidget: false,
                              leadingIcon: '',
                              bgColor: Colors.transparent))
                    ],
                  ),
                  Divider(
                    color: AppColors.gray.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 15.w,
                        color: AppColors.themeOrange,
                      ),
                      SizedBox(
                        width: 3.h,
                      ),
                      SingleTextLineWidget(
                        text: "Add Stop",
                        weight: FontWeight.bold,
                        color: AppColors.themeOrange,
                        size: 13.sp,
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w - 10),
          child: SingleTextLineWidget(
            text: "Available vehicles",
            size: 14.sp,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Widget trackingWidget(
      {required String title,
      required String subtitle,
      required bool hasLeadingWidget,
      required String leadingIcon,
      required Color bgColor,
      required bool hasExtra}) {
    return ListTile(
      minLeadingWidth: 0,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: hasLeadingWidget
          ? CircleAvatar(
              radius: 15.r,
              backgroundColor: bgColor.withOpacity(0.2),
              child: SvgImage(
                asset: leadingIcon,
                height: 17.w,
                width: 17.w,
              ),
            )
          : const SizedBox(),
      title: SingleTextLineWidget(
        text: title,
        size: 12.sp,
      ),
      subtitle: hasExtra
          ? Row(
              children: [
                Container(
                  height: 5.w,
                  width: 5.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.green),
                ),
                SizedBox(
                  width: 4.h,
                ),
                SingleTextLineWidget(
                  text: subtitle,
                  weight: FontWeight.bold,
                  size: 12.sp,
                ),
              ],
            )
          : SingleTextLineWidget(
              text: subtitle,
              weight: FontWeight.bold,
              size: 12.sp,
            ),
    );
  }
}
