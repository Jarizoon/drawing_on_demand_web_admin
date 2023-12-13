import 'package:drawing_on_demand_web_admin/data/models/statistic_model.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/statistic.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Statistic(
                  sta: StatisticModel(
                      name: "Users",
                      number: getNumberUser(),
                      imageSrc: userIcon)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Statistic(
                  sta: StatisticModel(
                      name: "Orders",
                      number: getNumberOrder(),
                      imageSrc: orderIcon)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Statistic(
                  sta: StatisticModel(
                      name: "Profit",
                      number: getProfit(),
                      imageSrc: profitIcon)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Statistic(
                  sta: StatisticModel(
                      name: "Done Req",
                      number: getNumberDoneReq(),
                      imageSrc: requirementIcon)),
            ),
          ),
        ],
      ),
    );
  }
}

getNumberUser() {
  return 526;
}

getNumberOrder() {
  return 125;
}

getProfit() {
  return 2980000;
}

getNumberDoneReq() {
  return 35;
}
