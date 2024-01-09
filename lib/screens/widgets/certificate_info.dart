import 'package:drawing_on_demand_web_admin/data/model/certificate_model.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CertificateInfo extends StatelessWidget {
  const CertificateInfo({Key? key, required this.cer, required this.imageSize}) : super(key: key);
  final CertificateModel cer;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    String? image = emptyImage;
    if (cer.image != "") {
      image = cer.image;
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              image!,
              height: imageSize,
              width: imageSize,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Text(cer.name!,
                  style: const TextStyle(
                      color: blackColor, fontWeight: FontWeight.w500)),
              Text(cer.achievedDate!,
                  style: const TextStyle(
                      color: blackColor, fontWeight: FontWeight.w500)),
              Text(cer.description!,
                  style: const TextStyle(
                      color: blackColor, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
