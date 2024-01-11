import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/data/model/handover_item_model.dart';
import 'package:drawing_on_demand_web_admin/data/model/handover_model.dart';
import 'package:drawing_on_demand_web_admin/data/model/oder_detail_model.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handover_item_info.dart';
import 'package:flutter/material.dart';

class HandoverItems extends StatelessWidget {
  const HandoverItems({Key? key, required this.handover}) : super(key: key);
  final HandoverModel handover;
  @override
  Widget build(BuildContext context) {
    List<HandoverItemModel> list = [
      HandoverItemModel(orderDetail: OrderDetailModel(artwork: artworkDemo[0])),
      HandoverItemModel(orderDetail: OrderDetailModel(artwork: artworkDemo[1]))
    ];
    int lenght = 0;
    if (handover.listItems != null) {
      lenght = handover.listItems!.length;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => HandoverItemInfo(
                item: list[index]),
          ),
        )
      ],
    );
  }
}