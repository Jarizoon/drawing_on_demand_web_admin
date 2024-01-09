// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/apis/order_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderList extends StatefulWidget {
  static dynamic state;
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  late Future<Orders?> orders;
  @override
  void initState() {
    super.initState();
    OrderList.state = this;
    orders = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: FutureBuilder(
              future: orders,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Order> list = snapshot.data!.value;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: 120,
                                child: const Center(
                                  child: Text('Orders',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: kWhite)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: kWhite,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: PaginatedDataTable(
                                columnSpacing: 10,
                                columns: const [
                                  DataColumn(
                                      label: Text("Order ID",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))),
                                  DataColumn(
                                      label: Text("Order Date",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))),
                                  DataColumn(
                                      label: Text("Order By",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))),
                                  DataColumn(
                                      label: Text("Total",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))),
                                  DataColumn(
                                      label: Text("Status",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))),
                                ],
                                source: OrderData(context: context, list: list),
                                rowsPerPage: 10,
                              ),
                            )),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class OrderData extends DataTableSource {
  final BuildContext context;
  final List<Order> list;
  OrderData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final order = list[index];
    return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.orderDetail, (route) => false,
            arguments: {order}),
        cells: [
          DataCell(Text(order.id.toString(),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text(order.orderDate.toString(),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${order.orderedByNavigation!.name}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${order.total}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${order.status}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

Future<Orders?> getData() async {
  try {
    return await OrderApi().gets(0, expand: 'orderedByNavigation');
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get orders failed');
  }
  return null;
}
