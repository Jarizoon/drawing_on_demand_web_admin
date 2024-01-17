import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/certificate.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/certificate_info.dart';
import 'package:flutter/material.dart';

class CertificateList extends StatelessWidget {
  const CertificateList({Key? key, required this.account}) : super(key: key);
  final Account? account;
  @override
  Widget build(BuildContext context) {
    List<Certificate>? list = account!.certificates;
    int lenght = 0;
    if (list != null) {
      lenght = list.length;
    }
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Certificates:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: lenght,
            shrinkWrap: true,
            itemBuilder: (context, index) => CertificateInfo(cer: list![index], imageSize: 50),
          ),
        )
      ],
    ));
  }
}
