import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:movemate/providers/home_navigation_provider.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/views/home/calculate/calculate.dart';
import 'package:movemate/views/home/home.dart';
import 'package:movemate/views/home/profile.dart';
import 'package:movemate/views/home/shipment/shipping.dart';
import 'package:movemate/widgets/nav_card_widget.dart';

class HomeNavigation extends ConsumerStatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeNavigation();
}

class _HomeNavigation extends ConsumerState<HomeNavigation> {
  final iconList = <IconData>[
    Icons.home_filled,
    Icons.calculate,
    Icons.history,
    Icons.person
  ];
  final iconText = <String>["Home", "Calculate", "Shipment", "Profile"];

  @override
  Widget build(BuildContext context) {
    // can not navigate back to exit the page
    final viewModel = ref.watch(homeViewModel);
    Future<bool> onBackPressed() {
      viewModel.changeIndex(0);
      return Future.delayed(const Duration(seconds: 2));
    }

    var pageIndex = viewModel.selectedIndex;
    // var pageIndexModel = ref.watch(pageIndexprovider);

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        bottomNavigationBar:  AnimatedBottomNavigationBar.builder(
          elevation: 0,
          backgroundColor: AppColors.white,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: index == 0 || index == 3 ? 0.w : 10.w),
              child: NavCardWidget(
                title: iconText[index],
                icon: iconList[index],
                isActive: isActive,
              ),
            );
          },
          activeIndex: pageIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.sharpEdge,
          onTap: viewModel.changeIndex,

          //other params
        ),
        body: [
          const HomeView(),
          const CalculatorView(),
          const ShippingView(),
           ProfileView(),
        ][pageIndex],
      ),
    );
  }
}
