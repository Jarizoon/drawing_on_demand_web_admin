import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomersInfo extends StatelessWidget {
  const CustomersInfo({Key? key, required this.info}) : super(key: key);
  final Account info;
  @override
  Widget build(BuildContext context) {
    String? imageSrc = emptyImage;
    if (info.avatar != "") {
      imageSrc = info.avatar;
    }
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
              width: 38,
              height: 38,
              child: Image(
                image: NetworkImage(imageSrc!),
                fit: BoxFit.contain,
              )),
          Text(info.name!, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
