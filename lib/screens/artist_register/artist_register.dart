import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/data/models/register_model.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class ArtistRegister extends StatefulWidget{
  const ArtistRegister({Key? key}) : super(key: key);

  @override
  State<ArtistRegister> createState () => _ArtistRegisterState();
}

class _ArtistRegisterState extends State<ArtistRegister>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: MediaQuery.of(context).size.width >= 650,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 250,
                          child: const Center(
                            child:  Text('Artist Registers', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: DataTable(
                        columnSpacing: 10,
                        columns: const [
                          DataColumn(label: Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Phone", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Gender", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                        ],
                        rows: List.generate(registerDemo.length, (index) => listRegistersDataRow(registerDemo[index], context))
                      ),
                    )
                  ),
              ],
            ),
          ),
        ), 
      ),
    );
  }
}

DataRow listRegistersDataRow(RegisterModel register, BuildContext context){
      return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(context, AppRoute.artistRegisterDetail, (route) => false, arguments: {register}),
        cells: [
        DataCell(Text("${register.email}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${register.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${register.phone}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${register.gender}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${register.address}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      ]);
}