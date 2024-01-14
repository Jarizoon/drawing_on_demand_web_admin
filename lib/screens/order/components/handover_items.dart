import 'package:drawing_on_demand_web_admin/data/models/handover.dart';
import 'package:drawing_on_demand_web_admin/data/models/handover_item.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handover_item_info.dart';
import 'package:flutter/material.dart';

class HandoverItems extends StatelessWidget {
  const HandoverItems({Key? key, required this.handover}) : super(key: key);
  final Handover handover;
  @override
  Widget build(BuildContext context) {
    List<HandoverItem>? list = handover.handoverItems;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => HandoverItemInfo(item: list![index]),
          ),
        )
      ],
    );
  }
}
