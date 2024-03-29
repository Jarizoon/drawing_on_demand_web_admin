import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/order_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/requirement_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/discount.dart';
import 'package:drawing_on_demand_web_admin/data/models/statistic_model.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/statistic.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                  future: getUserNumber(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int number = snapshot.data!.value.length;
                      return Statistic(sta: StatisticModel(name: "Users", number: number, imageSrc: userIcon));
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  })),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                  future: getOrderNumber(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int number = snapshot.data!.value.where((order) => order.status != "Cart").length;
                      return Statistic(sta: StatisticModel(name: "Orders", number: number, imageSrc: orderIcon));
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  })),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 6,
          child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                  future: getProfitNumber(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      double profit = snapshot.data!;
                      return Statistic(sta: StatisticModel(name: "Income", number: profit.toInt(), imageSrc: profitIcon));
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  })),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 6,
          child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                  future: getRequirementNumber(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Statistic(sta: StatisticModel(name: "Requirements", number: snapshot.data!.value.length, imageSrc: requirementIcon));
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  })),
        ),
      ],
    );
  }
}

Future<Accounts?> getUserNumber() async {
  try {
    return await AccountApi().gets(0);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get accounts failed');
  }
  return null;
}

Future<Orders?> getOrderNumber() async {
  try {
    return await OrderApi().gets(0);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get orders failed');
  }
  return null;
}

Future<Requirements?> getRequirementNumber() async {
  try {
    return await RequirementApi().gets(0);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get requirements failed');
  }
  return null;
}

Future<double?> getProfitNumber() async {
  try {
    var orders = await OrderApi().gets(0, expand: 'discount');
    var list = orders.value.where((order) => order.status != "Cart").toList();
    double profit = 0;
    for (var i = 0; i < list.length; i++) {
      if (list[i].discount == null) {
        list[i].discount = Discount(discountPercent: 0);
      }
      profit = profit + list[i].total! - list[i].total! * list[i].discount!.discountPercent!.toDouble();
    }
    return profit;
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get orders failed');
  }
  return null;
}
