import 'package:drawing_on_demand_web_admin/data/model/statistic_model.dart';
import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key, required this.sta}) : super(key: key);
  final StatisticModel sta;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(sta.name!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(sta.number.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).size.width >= 850,
            child: Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(
                  child: Image.asset(
                    sta.imageSrc!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
    );
  }
}
