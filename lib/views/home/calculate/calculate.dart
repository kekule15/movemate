import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movemate/providers/calculate_provider.dart';
import 'package:movemate/providers/home_navigation_provider.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/utils/images.dart';
import 'package:movemate/utils/logger.dart';
import 'package:movemate/views/home/calculate/total_estimate_view.dart';
import 'package:movemate/views/home/calculate/widgets/multi_card_option_widget.dart';
import 'package:movemate/widgets/custom_button.dart';
import 'package:movemate/widgets/customfield.dart';
import 'package:movemate/widgets/image_widgets.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class CalculatorView extends ConsumerStatefulWidget {
  const CalculatorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends ConsumerState<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          headerWidget(),
          Padding(
            padding: EdgeInsets.only(top: 110.h),
            child: bodyWidget(),
          ),
        ],
      ),
    );
  }

  Widget headerWidget() {
    final viewModel = ref.watch(homeViewModel);
    return Container(
      height: 100.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    viewModel.changeIndex(0);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white,
                    size: 20.w,
                  ),
                ),
                SingleTextLineWidget(
                  text: "Calculate",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 50.w,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyWidget() {
    var viewModel = ref.watch(calculateProviderViewModel);
    List<String> caetgoryItemList = viewModel.categoryListType;

    var selectedItem = viewModel.categoryList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10.w,
          ),
          SingleTextLineWidget(
            text: "Destination",
            weight: FontWeight.bold,
            color: AppColors.headerTextColor,
            size: 18.sp,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 200.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(13.r)),
            child: Padding(
              padding: EdgeInsets.all(14.0.w),
              child: Column(
                children: [
                  CustomField(
                    fillColor: AppColors.gray.withOpacity(0.1),
                    pIcon: const Icon(Icons.unarchive_outlined),
                    hint: "Sender location",
                    //focusedBorder: InputBorder.none,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    fillColor: AppColors.gray.withOpacity(0.1),
                    pIcon: const Icon(Icons.archive_outlined),
                    hint: "Receiver location",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    fillColor: AppColors.gray.withOpacity(0.1),
                    pIcon: const Icon(Icons.scale_outlined),
                    hint: "Approx weight",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          SingleTextLineWidget(
            text: "Packaging",
            weight: FontWeight.bold,
            color: AppColors.headerTextColor,
            size: 18.sp,
          ),
          SizedBox(
            height: 5.h,
          ),
          SingleTextLineWidget(
            text: "What are you sending?",
            size: 12.sp,
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            height: 50.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        const ImageWidget(asset: loadIcon),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          height: 48.h,
                          width: 1.w,
                          color: AppColors.gray,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleTextLineWidget(
                          text: "Box",
                          weight: FontWeight.bold,
                          color: AppColors.headerTextColor,
                          size: 15.sp,
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          SingleTextLineWidget(
            text: "Categories",
            weight: FontWeight.bold,
            color: AppColors.headerTextColor,
            size: 18.sp,
          ),
          SizedBox(
            height: 5.h,
          ),
          SingleTextLineWidget(
            text: "What are you sending?",
            size: 12.sp,
          ),
          SizedBox(
            height: 20.w,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 9,
            children: List.generate(caetgoryItemList.length, (index) {
              var data = caetgoryItemList[index];

              return MultiCardOptionWidget(
                isSelected: selectedItem.contains(data),
                onTap: () {
                  if (selectedItem.contains(data)) {
                    AppLogger.logg("removed");
                    viewModel.removeCategoryType(data);
                  } else {
                    AppLogger.logg("added");
                    viewModel.addCategoryType(data);
                  }
                },
                title: data,
              );
            }),
          ),
          SizedBox(
            height: 20.w,
          ),
          ActionCustomButton(
              borderRadius: 14.r,
              btnColor: AppColors.themeOrange,
              title: "Calculate",
              titleColor: AppColors.white,
              isLoading: false,
              onclick: () {
                Get.to(()=> const TotalEstimateView());
              }),
          SizedBox(
            height: 50.w,
          ),
        ],
      ),
    );
  }
}
