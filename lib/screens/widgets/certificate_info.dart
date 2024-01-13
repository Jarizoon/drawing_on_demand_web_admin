import 'package:drawing_on_demand_web_admin/data/models/certificate.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class CertificateInfo extends StatelessWidget {
  const CertificateInfo({Key? key, required this.cer, required this.imageSize}) : super(key: key);
  final Certificate? cer;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd');
    String? image = emptyImage;
    if (cer!.image != "" && cer!.image != null) {
      image = cer!.image;
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration( border: Border.all(width: 1.0, color: blackColor)),
              width: 100,
              height: 100,
              child: Image(
                image: NetworkImage(image!),
                fit: BoxFit.contain,
              )),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cer!.name!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              Text("Acchive Date: ${f.format(cer!.achievedDate!)}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              Text(cer!.description!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
