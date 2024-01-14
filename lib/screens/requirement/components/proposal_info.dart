import 'package:drawing_on_demand_web_admin/data/models/proposal.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProposalInfo extends StatelessWidget {
  const ProposalInfo({Key? key, required this.proposal, required this.imageSize}) : super(key: key);
  final Proposal? proposal;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    String? image = emptyImage;
    if (proposal!.artworkId != null && proposal!.artworkId.toString() != ""){
      image = proposal!.artwork!.arts!.first.image;
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(border: Border.all(width: 1.0, color: blackColor)),
                  width: 100,
                  height: 100,
                  child: Image(
                    image: NetworkImage(image!),
                    fit: BoxFit.contain,
                  ))),
          const SizedBox(width: 20),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Intoduction: ${proposal!.introduction}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Text("Created by: ${proposal!.createdByNavigation!.name}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                ],
              )),
          const SizedBox(width: 20),
          Expanded(
              flex: 1,
              child: Center(
                child: Text("Status: ${proposal!.status}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
              ))
        ],
      ),
    );
  }
}
