import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({Key? key, required this.order}) : super(key: key);
  final Order? order;
  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd');
    return InkWell(
      onTap: () => context.goNamed(OrderDetailRoute.name, pathParameters: {'order_id': order!.id.toString()}),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1.0, color: blackColor)),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(order!.orderType!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                )),
            const SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: Center(
                  child: Text("Created Date: ${f.format(order!.orderDate!)}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                )),
            const SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: Center(
                  child: Text("Total: ${order!.total!}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                )),
            const SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(order!.status!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                ))
          ],
        ),
      ),
    );
  }
}
