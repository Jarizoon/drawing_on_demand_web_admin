// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/models/account_review.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountReviewInfo extends StatelessWidget {
  const AccountReviewInfo({Key? key, required this.accountReview}) : super(key: key);
  final AccountReview? accountReview;
  @override
  Widget build(BuildContext context) {
    double star = 0;
    if (accountReview!.star != null || accountReview!.star != 0) {
      star = accountReview!.star!.toDouble();
    }

    final f = DateFormat("yyyy-MM-dd  hh:mm");

    List<Widget> stars = [];
    stars.add(const Text("Rate: "));
    for (int i = 0; i < star; i++) {
      var sta = const Icon(Icons.star, color: Colors.amber, size: 20);
      stars.add(sta);
      var box = const SizedBox(width: 5);
      stars.add(box);
    }
    for (int i = 0; i < 5 - star; i++) {
      var sta = const Icon(Icons.star, color: Colors.grey, size: 20);
      stars.add(sta);
      var box = const SizedBox(width: 5);
      stars.add(box);
    }
    return Container(
        decoration: BoxDecoration(border: Border.all(width: 1.0, color: blackColor)),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(accountReview!.createdByNavigation!.name!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                    )),
                const SizedBox(width: 20),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Created Date: ${f.format(accountReview!.createdDate!)}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                    )),
                const SizedBox(width: 20),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        width: 200,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: stars),
                      ),
                    )),
              ],
            ),
            Text(accountReview!.comment!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
