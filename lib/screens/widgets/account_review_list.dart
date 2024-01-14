import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/account_review.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/account_review_info.dart';
import 'package:flutter/material.dart';

class AccountReviewList extends StatelessWidget {
  const AccountReviewList({Key? key, required this.account}) : super(key: key);
  final Account? account;
  @override
  Widget build(BuildContext context) {
    List<AccountReview>? list = account!.accountReviewAccounts;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Review:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => AccountReviewInfo(accountReview: list![index]),
          ),
        )
      ],
    ));
  }
}
