import 'package:drawing_on_demand_web_admin/data/model/account_model.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomersInfo extends StatelessWidget {
  const CustomersInfo({Key? key, required this.info}) : super(key: key);
  final AccountModel info;
  @override
  Widget build(BuildContext context) {
    String? imageSrc = userIcon;
    if (info.imageSrc != "") {
      imageSrc = info.imageSrc;
    }
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              imageSrc!,
              height: 38,
              width: 38,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(info.name!,
                style: const TextStyle(
                    color: blackColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
