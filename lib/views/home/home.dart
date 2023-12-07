import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/utils/svgs.dart';
import 'package:movemate/views/home/search_screen.dart';
import 'package:movemate/widgets/customfield.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final vehicleIconList = <String>[
    oceanFreightImage,
    cargoFreightImage,
    oceanFreightImage
  ];
  final vehicleTitleText = <String>[
    "Ocean Freight",
    "Cargo Freight",
    "Air Freight",
  ];
  final vehicleSubTitleText = <String>[
    "International",
    "Reliable",
    "International",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Animate(
            effects: [
              //FadeEffect(),
              //ScaleEffect()
              SlideEffect(duration: 600.ms, curve: Curves.easeOut),
              
            ],
            child: headerWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 170.h),
            child: bodyWidget(),
          ),
        ],
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 170.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.white,
                backgroundImage: const AssetImage(picAvatar),
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
              readonly: true,
              onTap: () {
                Get.to(() => const SearchScreenView());
              },
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
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 15.h,
        ),
        Animate(
          effects: [
            //FadeEffect(),
            //ScaleEffect()
            SlideEffect(
                //delay: Duration(milliseconds: 10),
                duration: 200.ms,
                curve: Curves.elasticIn,
                begin: Offset(0.0, 30)),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: generalHorizontalPadding.w),
                child: SingleTextLineWidget(
                  text: "Tracking",
                  size: 14.sp,
                  color: AppColors.headerTextColor,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: generalHorizontalPadding.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const SingleTextLineWidget(
                              text: "Shipment Number"),
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
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: SingleTextLineWidget(
            text: "Available vehicles",
            size: 14.sp,
            weight: FontWeight.bold,
            color: AppColors.headerTextColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        // Column(
        //     children: AnimateList(
        //   interval: 400.ms,
        //   effects: [FadeEffect(duration: 300.ms)],
        //   children:  List.generate(
        //           vehicleIconList.length,
        //           (index) => Container(
        //                 margin: EdgeInsets.only(
        //                     left: 14.w, right: index == 2 ? 20.w : 0),
        //                 width: 140.w,
        //                 height: 170.h,
        //                 decoration: BoxDecoration(
        //                   color: AppColors.white,
        //                   borderRadius: BorderRadius.circular(5.r),
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: SingleTextLineWidget(
        //                         text: vehicleTitleText[index],
        //                         weight: FontWeight.w600,
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 2.h,
        //                     ),
        //                     Padding(
        //                       padding: EdgeInsets.symmetric(horizontal: 8.w),
        //                       child: SingleTextLineWidget(
        //                         text: vehicleSubTitleText[index],
        //                         size: 10.sp,
        //                       ),
        //                     ),
        //                     Align(
        //                       alignment: Alignment.topRight,
        //                       child: ImageWidget(
        //                         asset: vehicleIconList[index],
        //                         height: 120,
        //                         // width: MediaQuery.sizeOf(context).width,
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               )
        //               ),
        // )

        //),
        SizedBox(
          height: 150.h,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: AnimateList(
                interval: 200.ms,
                effects: [
                  FadeEffect(duration: 200.ms, curve: Curves.easeIn),
                  // SlideEffect(duration: 200.ms),
                  // MoveEffect(duration: 200.ms)
                ],
                children: List.generate(
                    vehicleIconList.length,
                    (index) => Container(
                          margin: EdgeInsets.only(
                              left: 14.w, right: index == 2 ? 20.w : 0),
                          width: 140.w,
                          height: 170.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleTextLineWidget(
                                  text: vehicleTitleText[index],
                                  weight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: SingleTextLineWidget(
                                  text: vehicleSubTitleText[index],
                                  size: 10.sp,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: ImageWidget(
                                  asset: vehicleIconList[index],
                                  height: 120,
                                  // width: MediaQuery.sizeOf(context).width,
                                ),
                              )
                            ],
                          ),
                        )),
              )),
        ),
        SizedBox(
          height: 50.h,
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
