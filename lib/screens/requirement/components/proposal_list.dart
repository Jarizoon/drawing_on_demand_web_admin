import 'package:drawing_on_demand_web_admin/data/models/proposal.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/screens/requirement/components/proposal_info.dart';
import 'package:flutter/material.dart';

class ProposalList extends StatelessWidget {
  const ProposalList({Key? key, required this.requirement}) : super(key: key);
  final Requirement? requirement;
  @override
  Widget build(BuildContext context) {
    List<Proposal>? list = requirement!.proposals;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("Proposal:", style: TextStyle(fontSize: 20, fontWeight:FontWeight.w600)),
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                ProposalInfo(proposal: list![index], imageSize: 50),
          ),
        )
      ],
    ));
  }
}
