// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/models/handover_item.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HandoverItemInfo extends StatelessWidget {
  const HandoverItemInfo({Key? key, required this.item}) : super(key: key);
  final HandoverItem item;
  @override
  Widget build(BuildContext context) {
    String? image = emptyImage;
    if (item.orderDetail != null) {
      if(item.orderDetail!.artwork != null){
        if(item.orderDetail!.artwork!.arts != null){
          image = item.orderDetail!.artwork!.arts![0].image;
        }
      }
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              width: 120,
              height: 120,
              child: Image(
                image: NetworkImage(image!),
                fit: BoxFit.contain,
              )),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title: ${item.orderDetail!.artwork!.title}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text("Price: ${item.orderDetail!.price}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    width: 200,
                    child: Text("Quantity: ${item.orderDetail!.quantity}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    width: 200,
                    child: Text("Fee: ${item.orderDetail!.fee}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
