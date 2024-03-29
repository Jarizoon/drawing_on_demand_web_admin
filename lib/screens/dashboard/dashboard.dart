// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/charts.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/customers_order_recently.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/statistics.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 7,
                      child: Container(
                          height: 650,
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  child: const Statistics(),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 450,
                                  child: const Charts(),
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(width: 12),
                    Visibility(
                      visible: MediaQuery.of(context).size.width >= 950,
                      child: Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.all(18),
                            height: 650,
                            decoration: const BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "Most spending customers",
                                    style: TextStyle(
                                      color: kWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  CustomersOrderRecently(),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
