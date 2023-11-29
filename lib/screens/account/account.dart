import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/data/models/account_model.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Account extends StatefulWidget{
  const Account({Key? key}) : super(key: key);
  @override
  State<Account> createState () => _AccountState();
}

class _AccountState extends State<Account>{
  String? status, role;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(             
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: 150,
                            child: const Center(
                              child:  Text('Accounts', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                            ),
                          ),
                        ),
                        Visibility(visible: MediaQuery.of(context).size.width >= 450, child:  Spacer(flex: MediaQuery.of(context).size.width >= 1100 ? 2 : 1,)),
                        Container(
                          width: 160,
                          child: const Search(),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 240,
                          child: Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Row(
                                children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 2,
                                  child: DropdownButton<String?>(
                                    value: status,
                                    icon: Image.asset(dropdownIcon, width: 15, height: 15,),
                                    style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                    hint: const Text('Status'),
                                    onChanged: (value){
                                      setState(() {
                                        status = value;
                                      });
                                    },
                                    items: ["Active","Deactive"].map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e,child: Text(e.toString()))).toList()
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 2,
                                  child: DropdownButton<String?>(
                                    value: role,
                                    icon: Image.asset(dropdownIcon, width: 15, height: 15,),
                                    style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                    hint: const Text('Role'),
                                    onChanged: (value){
                                      setState(() {       
                                        role = value;
                                      });
                                    },
                                    items: ["Customer","Artist","Staff","Admin"].map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e,child: Text(e.toString()))).toList()
                                    ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(onPressed: (){}, icon: Image.asset(filterIcon, fit: BoxFit.cover,)),
                                )
                                ],
                              ),
                            )
                          ),
                        ),
                        const SizedBox(width: 10),                       
                      ],
                    ),
                  ),

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
                          DataColumn(label: Text("Role", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          DataColumn(label: Text("Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                        ],
                        rows: List.generate(accountDemo.length, (index) => listAccountsDataRow(accountDemo[index], context))
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

DataRow listAccountsDataRow(AccountModel account, BuildContext context){
      return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(context, AppRoute.orderDetail, (route) => false, arguments: {account}),
        cells: [
        DataCell(Text("${account.email}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${account.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${account.phone}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${account.role}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        DataCell(Text("${account.status}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      ]);
}