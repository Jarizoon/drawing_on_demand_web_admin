import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class RequirementInfo extends StatelessWidget {
  const RequirementInfo({Key? key, required this.req, required this.imageSize}) : super(key: key);
  final Requirement? req;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd');
    String? image = emptyImage;
    if (req!.image != "" && req!.image != null) {
      image = req!.image;
    }
    return InkWell(
      onTap: () => context.goNamed(RequirementDetailRoute.name, pathParameters: {'requirement_id': req!.id.toString()}),
      child: Container(
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
                  children: [
                    Text(req!.title!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text("Created Date: ${f.format(req!.createdDate!)}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text(req!.budget!.toString(), style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(req!.status!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                ))
          ],
        ),
      ),
    );
  }
}
