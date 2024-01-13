// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/artwork_list.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/certificate_list.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/order_list.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/requirement_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountDetailPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const AccountDetailPage({Key? key, this.id}) : super(key: key);
  @override
  State<AccountDetailPage> createState() => _AccountDetailPageState();
  static void refresh() {
    state.refresh();
  }
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  final ScrollController controller = ScrollController();
  late Future<Account?> account;
  @override
  void initState() {
    super.initState();
    AccountDetailPage.state = this;
    account = getData();
  }

  @override
  Widget build(BuildContext context) {
    final f = DateFormat("yyyy-MM-dd  hh:mm");
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: account,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Account acc = snapshot.data!;
                    String status = acc.status!;
                    String image = emptyImage;
                    if (snapshot.data!.avatar != null && snapshot.data!.avatar != "") {
                      image = snapshot.data!.avatar.toString();
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(top: 18, left: 18),
                            height: 70,
                            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                            child: const Text('Account Detail', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Scrollbar(
                                      controller: controller,
                                      child: SingleChildScrollView(
                                        controller: controller,
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 1180,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                              padding: const EdgeInsets.all(5),
                                                              width: 200,
                                                              height: 200,
                                                              child: Image(
                                                                image: NetworkImage(image),
                                                                fit: BoxFit.contain,
                                                              )),
                                                          Visibility(
                                                              visible: status != "Not Available",
                                                              child: Center(
                                                                child: TextButton(
                                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                                                  child: const Text("Deactivate", style: TextStyle(color: kWhite)),
                                                                  onPressed: () async {
                                                                    AccountDetailPage.refresh();
                                                                  },
                                                                ),
                                                              )),
                                                          Visibility(
                                                              visible: status == "Not Available",
                                                              child: Center(
                                                                child: TextButton(
                                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                                  child: const Text("Activate", style: TextStyle(color: kWhite)),
                                                                  onPressed: () async {
                                                                    AccountDetailPage.refresh();
                                                                  },
                                                                ),
                                                              ))
                                                        ],
                                                      )),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                      flex: 5,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(flex: 1, child: Text("Name: ${acc.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Expanded(flex: 3, child: Text("Email: ${acc.email}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)))
                                                              
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              Expanded(flex: 1, child: Text("Role: ${acc.accountRoles!.first.role!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Expanded(flex: 3, child: Text("Status: ${acc.status}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              Expanded(flex: 1, child: Text("Phone: ${acc.phone}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Expanded(flex: 3, child: Text("Address: ${acc.address}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              Expanded(flex: 1, child: Text("Gender: ${acc.gender}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Expanded(flex: 3, child: Text("Created Date: ${f.format(acc.createdDate!)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Text("Bio: ${acc.bio}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 1150,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.all(10),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                Visibility(
                                                    visible: acc.accountRoles!.first.role!.name == "Artist" && acc.accountRoles!.first.status == "Active",
                                                    child: Container(
                                                      height: 200,
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.only(top: 20),
                                                      decoration: BoxDecoration(boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 15,
                                                          spreadRadius: 1,
                                                        )
                                                      ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                      child: CertificateList(account: acc),
                                                    )),
                                                Visibility(
                                                    visible: acc.accountRoles!.first.role!.name == "Artist" && acc.accountRoles!.first.status == "Active",
                                                    child: Container(
                                                      height: 200,
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.only(top: 20),
                                                      decoration: BoxDecoration(boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 15,
                                                          spreadRadius: 1,
                                                        )
                                                      ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                      child: ArtworkList(account: acc),
                                                    )),
                                                Visibility(
                                                    visible: acc.accountRoles!.where((ar) => ar.role!.name == "Artist").isEmpty || acc.accountRoles!.where((ar) => ar.role!.name == "Artist" && ar.status == "Pending").isNotEmpty,
                                                    child: Container(
                                                      height: 200,
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.only(top: 20),
                                                      decoration: BoxDecoration(boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 15,
                                                          spreadRadius: 1,
                                                        )
                                                      ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                      child: RequirementList(account: acc),
                                                    )),
                                                Visibility(
                                                    visible: acc.accountRoles!.where((ar) => ar.role!.name == "Artist").isEmpty || acc.accountRoles!.where((ar) => ar.role!.name == "Artist" && ar.status == "Pending").isNotEmpty,
                                                    child: Container(
                                                      height: 200,
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.only(top: 20),
                                                      decoration: BoxDecoration(boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 15,
                                                          spreadRadius: 1,
                                                        )
                                                      ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                      child: OrderList(account: acc),
                                                    ))
                                              ]),
                                            ),
                                          ],
                                        ),
                                      )))),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                })),
      ),
    );
  }

  Future<Account?> getData() async {
    try {
      return await AccountApi().getOne(widget.id!, 'certificates,accountRoles(expand=role),artworks(expand=arts,category),requirements,orders');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get artworks failed');
    }
    return null;
  }

  void refresh() {
    setState(() {
      account = getData();
    });
  }
}
