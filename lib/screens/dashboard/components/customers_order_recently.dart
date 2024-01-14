import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/customers_info.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomersOrderRecently extends StatelessWidget {
  const CustomersOrderRecently({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 580,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: kWhite),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<Account, double> mapData = {};
                List<Account> list = snapshot.data!.value.where((account) => account.accountRoles!.where((ar) => ar.role!.name == "Artist").isEmpty || account.accountRoles!.where((ar) => ar.role!.name == "Artist" && ar.status == "Pending").isNotEmpty).toList();
                for (var i = 0; i < list.length; i++) {
                  double spending = 0;
                  if (list[i].orders != null) {
                    spending = getSpending(list[i].orders!);
                  }
                  if (spending > 0) {
                  mapData.addAll({list[i]: spending});
                  }
                }
                List<MapEntry<Account, double>> listData = mapData.entries.toList();
                listData.sort((a, b) => b.value.compareTo(a.value));
                Map<Account, double> sortedMap = Map.fromEntries(listData);
                List<Account> sortedList = [];
                List<MapEntry<Account, double>> entries = sortedMap.entries.toList();
                for (var i = 0; i < entries.length; i++) {
                  sortedList.add(entries[i].key);
                }
                int length = 9;
                if (sortedList.length < 9) {
                  length = sortedList.length;
                }
                return SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: length,
                    itemBuilder: (context, index) => CustomersInfo(info: sortedList[index]),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }));
  }

  double getSpending(List<Order> orders) {
    double spending = 0;
    for (var i = 0; i < orders.length; i++) {
      spending = spending + orders[i].total!;
    }
    return spending;
  }

  Future<Accounts?> getData() async {
    try {
      return await AccountApi().gets(0, expand: 'accountRoles(expand=role),orders');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get accounts failed');
    }
    return null;
  }
}
