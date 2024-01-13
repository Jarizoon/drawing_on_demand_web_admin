import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/requirement_info.dart';
import 'package:flutter/material.dart';

class RequirementList extends StatelessWidget {
  const RequirementList({Key? key, required this.account}) : super(key: key);
  final Account? account;
  @override
  Widget build(BuildContext context) {
    List<Requirement>? list = account!.requirements;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("Requirements:", style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600)),
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                RequirementInfo(req: list![index], imageSize: 50),
          ),
        )
      ], 
    ));
  }
}
