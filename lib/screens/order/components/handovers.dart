import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handover_info.dart';
import 'package:flutter/material.dart';

class HandoversList extends StatelessWidget {
  const HandoversList({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    int lenght = 0;
    if (order.handovers != null) {
      lenght = order.handovers!.length;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => HandoverInfo(handover: order.handovers![index]),
          ),
        )
      ],
    );
  }
}
