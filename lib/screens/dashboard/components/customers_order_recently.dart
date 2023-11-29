import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/components/customers_info.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class CustomersOrderRecently extends StatelessWidget{
  const CustomersOrderRecently({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      height: 580,
      decoration:const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: kWhite),
      child: SingleChildScrollView(
        child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (context, index) => CustomersInfo(info: accountDemo[index]),
        ),
      )
    );
  }
}