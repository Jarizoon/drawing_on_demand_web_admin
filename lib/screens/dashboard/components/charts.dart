import 'package:drawing_on_demand_web_admin/screens/dashboard/components/bar_chart.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Charts extends StatelessWidget{
  const Charts({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context){
    return  Expanded(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("User increasement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
                  Container(
                    height: 350,
                    child: SimpleBarChart.withSampleData(),
                  ),
                ],
              ),
            ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Order increasement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
                  Container(
                    height: 350,
                    child: SimpleBarChart.withSecondleData(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}