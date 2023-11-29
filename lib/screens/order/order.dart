// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/data/models/order_model.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget{
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState () => _OrderState();
}

class _OrderState extends State<Order>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: 120,
                        child: const Center(
                          child:  Text('Orders', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: DataTable(
                        columnSpacing: 10,
                        columns: const [
                          DataColumn(label: Text("Order Date", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Order By", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Price", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                        ],
                        rows: List.generate(orderDemo.length, (index) => listOrdersDataRow(orderDemo[index], context))
                      ),
                    )
                  ),
              ],
            ),
          ),
        ), 
      ),
    );   
  }
}

DataRow listOrdersDataRow(OrderModel order, BuildContext context){
      return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(context, AppRoute.orderDetail, (route) => false, arguments: {order}),
        cells: [
        DataCell(Text("${order.dateTime}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${order.orderBy}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${order.total} VND", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${order.status}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      ]);
}



