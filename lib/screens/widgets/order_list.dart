import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/order_info.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key, required this.account}) : super(key: key);
  final Account? account;
  @override
  Widget build(BuildContext context) {
    List<Order>? list = account!.orders;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Orders:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => OrderInfo(order: list![index]),
          ),
        )
      ],
    ));
  }
}
