// ignore_for_file: sized_box_for_whitespace
import 'package:drawing_on_demand_web_admin/data/models/handover.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handover_items.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class HandoverInfo extends StatelessWidget {
  const HandoverInfo({Key? key, required this.handover}) : super(key: key);
  final Handover handover;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Text(handover.name.toString(), style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500))),
                Expanded(flex: 1, child: Text("Phone: ${handover.phone}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500))),
                Expanded(flex: 1, child: Text("Shipment Price: ${handover.shipmentPrice}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500))),
                Expanded(flex: 1, child: Text("Status: ${handover.status}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Expanded(flex: 1, child: Text("Estimated Delivery Date: ${DateFormat("yyyy-MM-dd").format(handover.estimatedDeliveryDate!)}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500))), Expanded(flex: 3, child: Text("Receive Adress: ${handover.receiveAddress}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)))],
            ),
            Container(
              width: 1180,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(10)),
              child: HandoverItems(handover: handover),
            )
          ],
        ));
  }
}
