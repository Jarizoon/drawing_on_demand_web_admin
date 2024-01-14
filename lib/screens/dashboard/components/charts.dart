// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/order_api.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/bar_chart.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                    future: getUserFollowMonth(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("User increasement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
                            Container(
                              height: 350,
                              child: SimpleBarChart.withSampleData(snapshot.data!),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    }))),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                    future: getOrderFollowMonth(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Order increasement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
                            Container(
                              height: 350,
                              child: SimpleBarChart.withSecondleData(snapshot.data!),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    }))),
          ),
        ],
      ),
    );
  }
}

Future<List<int>> getUserFollowMonth() async {
  List<int> list = [];
  try {
    var accounts = await AccountApi().gets(0);
    for (var i = 1; i < 5; i++) {
      var from = DateTime(DateTime.now().year, DateTime.now().month - i, DateTime.now().day);
      var to = DateTime(DateTime.now().year, DateTime.now().month - i + 1, DateTime.now().day);
      var listAccount = accounts.value.where((account) => account.createdDate!.compareTo(from) == 1 && account.createdDate!.compareTo(to) == -1);
      list.add(listAccount.length);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get category names failed');
  }
  return list;
}

Future<List<int>> getOrderFollowMonth() async {
  List<int> list = [];
  try {
    var orders = await OrderApi().gets(0);
    for (var i = 1; i < 5; i++) {
      var from = DateTime(DateTime.now().year, DateTime.now().month - i, DateTime.now().day);
      var to = DateTime(DateTime.now().year, DateTime.now().month - i + 1, DateTime.now().day);
      var listAccount = orders.value.where((order) => order.orderDate!.compareTo(from) == 1 && order.orderDate!.compareTo(to) == -1);
      list.add(listAccount.length);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get category names failed');
  }
  return list;
}
