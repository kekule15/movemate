import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/style/appColors.dart';
import 'package:movemate/utils/constvalues.dart';
import 'package:movemate/views/home/shipment/canceled_shipment.dart';
import 'package:movemate/views/home/shipment/completed_shipment.dart';
import 'package:movemate/views/home/shipment/in_progress_shipment.dart';
import 'package:movemate/views/home/shipment/pending_shipment.dart';
import 'package:movemate/views/home/shipment/widgets/shipment_card_widget.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

var shipmentTabProvider = StateProvider.autoDispose<int>((ref) => 0);

class ShippingView extends ConsumerStatefulWidget {
  const ShippingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<ShippingView> {
  final shippingTitleText = <String>[
    "All",
    "Completed",
    "In progress",
    "Pending order",
    "Cancelled",
  ];
  final shippingCountText = <String>[
    "12",
    "5",
    "3",
    "4",
    "0",
  ];
  @override
  Widget build(BuildContext context) {
    var stateValue = ref.watch(shipmentTabProvider);
    //var toggleStateValue = ref.read(shipmentTabProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          headerWidget(),
          Padding(
              padding: EdgeInsets.only(
                  top: 145.h,
                  left: generalHorizontalPadding.w,
                  right: generalHorizontalPadding.w),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SingleTextLineWidget(
                    text: "Shipments",
                    weight: FontWeight.bold,
                    size: 18.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  switch (stateValue) {
                    0 => bodyWidget(),
                    1 => const CompletedShipments(),
                    2 => const InProgressShipments(),
                    3 => const PendingShipments(),
                    _ => const CanceledShipments()
                  },
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget headerWidget() {
    var stateValue = ref.watch(shipmentTabProvider);
    var toggleStateValue = ref.read(shipmentTabProvider.notifier);
    return Container(
      height: 139.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SingleTextLineWidget(
            text: "Shipment history",
            color: AppColors.white,
            weight: FontWeight.bold,
            size: 18.sp,
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 50.h,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  shippingTitleText.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 8, right: 0, bottom: 0),
                        child: InkWell(
                          onTap: () {
                            toggleStateValue.state = index;
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20.w, right: index == 4 ? 20.w : 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: stateValue == index
                                        ? BorderSide(
                                            color: AppColors.themeOrange,
                                            width: 3.w)
                                        : BorderSide.none)),
                            child: Row(
                              children: [
                                SingleTextLineWidget(
                                  text: shippingTitleText[index],
                                  color: stateValue == index
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.8),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 13.h,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      color: stateValue == index
                                          ? AppColors.themeOrange
                                          : AppColors.white.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: SingleTextLineWidget(
                                      text: shippingCountText[index],
                                      color: stateValue == index
                                          ? AppColors.white
                                          : AppColors.white.withOpacity(0.8),
                                      size: 10.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyWidget() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        const ShipmentCardWidget(
          status: "progress",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "1400",
          date: "Sep 20,2023",
        ),
        SizedBox(
          height: 15.h,
        ),
        const ShipmentCardWidget(
          status: "pending",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "650",
          date: "Sep 20,2023",
        ),
        SizedBox(
          height: 15.h,
        ),
        const ShipmentCardWidget(
          status: "loading",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "2000",
          date: "Sep 20,2023",
        ),
        SizedBox(
          height: 15.h,
        ),
        const ShipmentCardWidget(
          status: "completed",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "1400",
          date: "Sep 20,2023",
        ),
        SizedBox(
          height: 15.h,
        ),
        const ShipmentCardWidget(
          status: "cancel",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "1400",
          date: "Sep 20,2023",
        )
      ],
    );
  }
}
