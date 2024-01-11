// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handovers.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final String? id;
  const OrderDetailPage({Key? key, this.id}) : super(key: key);
  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(top: 18, left: 18),
                  height: 70,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text('Order Detail',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kWhite)),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: kWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Scrollbar(
                            controller: controller,
                            child: SingleChildScrollView(
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(width: 1200, height: 50 ,child: Row( crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Container(width: 400, child: const Text("Order by: ", style: TextStyle(fontSize: 22))),
                                    Container(width: 400, child: const Text("Order date: ", style: TextStyle(fontSize: 22))),
                                  ])),
                                  Container(width: 1200, height: 50 ,child: Row( crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Container(width: 400, child: const Text("Total: ", style: TextStyle(fontSize: 22))),
                                    Container(width: 400, child: const Text("Status: ", style: TextStyle(fontSize: 22))),
                                  ])),
                                  Container(
                                  width: 1180,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade500,
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ],
                                        color: kWhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Handovers(order: orderDemo[0]),
                                    )
                                ],
                              ),
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
