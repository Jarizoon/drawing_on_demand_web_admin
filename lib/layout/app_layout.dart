// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/layout/navigation_panel.dart';
import 'package:drawing_on_demand_web_admin/layout/top_app_bar.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget content;

  const AppLayout({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1100) {
      return Scaffold(
        drawer: const NavigationPanel(),
        body: Builder(
          builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        color: secondaryColor,
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 40,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    icon: Image.asset(menuIcon),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 9,
                              child: TopAppBar(),
                            )
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: content,
                    ),
                  ],
                ),
              )),
        ),
      );
    } else {
      return Row(
        children: [
          const Expanded(flex: 1, child: NavigationPanel()),
          Expanded(
              flex: 5,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [Container(height: 75, color: secondaryColor, child: const TopAppBar()), Container(padding: const EdgeInsets.only(top: 5), child: content)],
                    ),
                  ))),
        ],
      );
    }
  }
}
