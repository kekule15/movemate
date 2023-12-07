import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/views/home/shipment/widgets/shipment_card_widget.dart';

class PendingShipments extends ConsumerWidget {
  const PendingShipments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        const ShipmentCardWidget(
          status: "pending",
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
          status: "pending",
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
          status: "pending",
          title: "Arriving today!",
          description:
              "Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!",
          amount: "1400",
          date: "Sep 20,2023",
        ),
      ],
    )
        .animate()
        .slide(
            curve: Curves.ease,
            duration: 300.ms,
            begin: const Offset(0, 5),
            end: const Offset(0, 0))
        .then();
  }
}
