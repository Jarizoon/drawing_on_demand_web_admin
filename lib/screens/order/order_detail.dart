// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/order_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/order/components/handovers.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderDetailPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const OrderDetailPage({Key? key, this.id}) : super(key: key);
  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  late Future<Order?> order;
  @override
  void initState() {
    super.initState();
    OrderDetailPage.state = this;
    order = getData();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final f = DateFormat('yyyy-MM-dd  hh:mm');
    return Scaffold(
      body: SafeArea(
          child: AppLayout(
              content: FutureBuilder(
                  future: order,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.status != "Cart") {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.only(top: 18, left: 18),
                              height: 70,
                              decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                              child: const Text('Order Detail', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Scrollbar(
                                        controller: controller,
                                        child: SingleChildScrollView(
                                            controller: controller,
                                            scrollDirection: Axis.horizontal,
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              Container(
                                                  width: 1150,
                                                  height: 50,
                                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    Container(width: 400, child: Text("Order by: ${snapshot.data!.orderedByNavigation!.name}", style: const TextStyle(fontSize: 22))),
                                                    Container(width: 400, child: Text("Order date: ${f.format(snapshot.data!.orderDate!)}", style: const TextStyle(fontSize: 22))),
                                                  ])),
                                              Container(
                                                  width: 1150,
                                                  height: 50,
                                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    Container(width: 400, child: Text("Order Type: ${snapshot.data!.orderType}", style: const TextStyle(fontSize: 22))),
                                                    Container(width: 400, child: Text("Discount: ${snapshot.data!.discount!.discountPercent! * 100}%", style: const TextStyle(fontSize: 22))),
                                                  ])),
                                              Container(
                                                  width: 1150,
                                                  height: 50,
                                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    Container(width: 400, child: Text("Total: ${snapshot.data!.total}", style: const TextStyle(fontSize: 22))),
                                                    Container(width: 400, child: Text("Status: ${snapshot.data!.status}", style: const TextStyle(fontSize: 22))),
                                                  ])),
                                              Visibility(
                                                  visible: snapshot.data!.status != "Reviewed",
                                                  child: Container(
                                                    width: 1150,
                                                    padding: const EdgeInsets.all(10),
                                                    margin: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.shade500,
                                                        offset: const Offset(4, 4),
                                                        blurRadius: 15,
                                                        spreadRadius: 1,
                                                      )
                                                    ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                    child: HandoversList(order: snapshot.data!),
                                                  ))
                                            ]))))),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  }))),
    );
  }

  Future<Order?> getData() async {
    try {
      return await OrderApi().getOne(
        widget.id!,
        'orderedByNavigation,discount,handovers(expand=handoverItems(expand=orderDetail(expand=artwork(expand=arts))))',
      );
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get order failed');
    }
    return null;
  }
}
