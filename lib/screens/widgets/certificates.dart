import 'package:drawing_on_demand_web_admin/data/model/account_model.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/certificate_info.dart';
import 'package:flutter/material.dart';

class Certificates extends StatelessWidget {
  const Certificates({Key? key, required this.account}) : super(key: key);
  final AccountModel account;
  @override
  Widget build(BuildContext context) {
    int lenght = 0;
    if (account.listCer != null) {
      lenght = account.listCer!.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                CertificateInfo(cer: account.listCer![index], imageSize: 50),
          ),
        )
      ],
    ));
  }
}
