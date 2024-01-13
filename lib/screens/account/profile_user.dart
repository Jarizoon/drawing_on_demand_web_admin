// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileUserPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const ProfileUserPage({Key? key, this.id}) : super(key: key);
  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
  static void refresh() {
    state.refresh();
  }
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  late Future<Account?> account;
  @override
  void initState() {
    super.initState();
    ProfileUserPage.state = this;
    account = getData();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: account,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String image = emptyImage;
                    if (snapshot.data!.avatar != null && snapshot.data!.avatar != "") {
                      image = snapshot.data!.avatar.toString();
                    }

                    final f = DateFormat('yyyy-MM-dd  hh:mm');
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(top: 18, left: 18),
                            height: 70,
                            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                            child: const Text('User Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
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
                                              width: 1200,
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
                                                          Center(
                                                            child: TextButton(
                                                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                              child: const Text("Update Avatar", style: TextStyle(color: kWhite, fontSize: 20)),
                                                              onPressed: () {},
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      width: 1180,
                                                      padding: const EdgeInsets.all(10),
                                                      margin: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 15,
                                                          spreadRadius: 1,
                                                        )
                                                      ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Email: ${snapshot.data!.email}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                          const SizedBox(height: 20),
                                                          Text("Role: ${snapshot.data!.accountRoles!.first.role!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                          const SizedBox(height: 20),
                                                          Text("Status: ${snapshot.data!.status}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                          const SizedBox(height: 20),
                                                          Text("Created Date: ${f.format(snapshot.data!.createdDate!)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                          const SizedBox(height: 20),
                                                          const Text("Gender:", style: TextStyle(color: blackColor)),
                                                          const SizedBox(height: 20),
                                                          const Text("Name:", style: TextStyle(color: blackColor)),
                                                          const SizedBox(height: 5),
                                                          TextFormField(
                                                            decoration: InputDecoration(hintText: "${snapshot.data!.name}", hintStyle: const TextStyle(color: blackColor)),
                                                          ),
                                                          const SizedBox(height: 20),
                                                          const Text("Address:", style: TextStyle(color: blackColor)),
                                                          const SizedBox(height: 5),
                                                          TextFormField(
                                                            decoration: InputDecoration(hintText: "${snapshot.data!.address}", hintStyle: const TextStyle(color: blackColor)),
                                                          ),
                                                          const SizedBox(height: 20),
                                                          const Text("Phone:", style: TextStyle(color: blackColor)),
                                                          const SizedBox(height: 5),
                                                          TextFormField(
                                                            decoration: InputDecoration(hintText: "${snapshot.data!.phone}", hintStyle: const TextStyle(color: blackColor)),
                                                          ),
                                                          const SizedBox(height: 20),
                                                          const Text("Bio:", style: TextStyle(color: blackColor)),
                                                          const SizedBox(height: 5),
                                                          TextFormField(
                                                            decoration: InputDecoration(hintText: "${snapshot.data!.bio}", hintStyle: const TextStyle(color: blackColor)),
                                                          ),
                                                          const SizedBox(height: 20),
                                                          Center(
                                                            child: TextButton(
                                                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                              child: const Text("Update Proflie", style: TextStyle(color: kWhite, fontSize: 20)),
                                                              onPressed: () {},
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
      return await AccountApi().getOne(widget.id!, 'accountRoles(expand=role)');
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get account failed');
    }
    return null;
  }

  Future<void> update(String accountId, String status) async {
    try {
      return await AccountApi().patchOne(accountId, {'Status': status});
    } catch (error) {
      Fluttertoast.showToast(msg: 'Update artwork status failed');
    }
  }

  void refresh() {
    setState(() {
      account = getData();
    });
  }
}
