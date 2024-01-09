import 'package:drawing_on_demand_web_admin/data/model/handover_model.dart';
import 'package:drawing_on_demand_web_admin/data/model/order_model.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handover_info.dart';
import 'package:flutter/material.dart';

class Handovers extends StatelessWidget {
  const Handovers({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    List<HandoverModel> list = [
      HandoverModel(name: "abcd"),
      HandoverModel(name: "xyz")
    ];
    int lenght = 0;
    if (order.listItems != null) {
      lenght = order.listItems!.length;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) => HandoverInfo(
                handover: list[index]),
          ),
        )
      ],
    );
  }
}
