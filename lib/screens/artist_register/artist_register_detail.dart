// ignore_for_file: use_build_context_synchronously

import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_role_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/artist_register/artist_register.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/certificate_list.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtistRegisterDetailPage extends StatefulWidget {
  final String? id;
  const ArtistRegisterDetailPage({Key? key, this.id}) : super(key: key);

  @override
  State<ArtistRegisterDetailPage> createState() => _ArtistRegisterDetailPageState();
}

class _ArtistRegisterDetailPageState extends State<ArtistRegisterDetailPage> {
  late Future<Account?> account;
  @override
  void initState() {
    super.initState();
    account = getData();
  }

  @override
  Widget build(BuildContext context) {
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
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            height: 70,
                            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: 180,
                              child: const Center(
                                child: Text('Artist Register Detail', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              height: 550,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Email: ${snapshot.data!.email}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                        Text("Phone: ${snapshot.data!.name}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                        Text("Gender: ${snapshot.data!.gender}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                        Text("Phone: ${snapshot.data!.phone}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                        Text("Address: ${snapshot.data!.address}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                        Container(
                                          height: MediaQuery.of(context).size.width >= 520 ? 350 : 300,
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
                                          child: CertificateList(account: snapshot.data),
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: MediaQuery.of(context).size.width >= 850,
                                    child: Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text("Avatar", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 200,
                                            height: 200,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(image),
                                              backgroundColor: kWhite,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  accept(snapshot.data!.accountRoles!.where((ar) => ar.role!.name == "Artist" && ar.status == "Pending").first.id.toString(), "Active");
                                                  // deleteAr(snapshot.data!.accountRoles!.where((ar) => ar.role!.name == "Customer" && ar.status == "Active").first.id.toString());
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.symmetric(vertical: 15),
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: kPrimaryColor, border: Border.all(width: 1.0, color: blackColor), borderRadius: BorderRadius.circular(30)),
                                                  child: const Text("Accept", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              InkWell(
                                                onTap: () {
                                                  deleteAr(snapshot.data!.accountRoles!.where((ar) => ar.role!.name == "Artist" && ar.status == "Pending").first.id.toString());
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.symmetric(vertical: 15),
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: redColor, border: Border.all(width: 1.0, color: blackColor), borderRadius: BorderRadius.circular(30)),
                                                  child: const Text("Reject", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
      return await AccountApi().getOne(
        widget.id!,
        'accountRoles(expand=role), certificates',
      );
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get account failed');
    }
    return null;
  }

  accept(String arId, String status) async {
    try {
      await AccountRoleApi().patchOne(arId, {'Status': status});
      await AccountRoleApi().patchOne(arId, {'LastModifiedDate': DateTime.now()});
      ArtistRegisterPage.refresh();
      GoRouter.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Accept Artist Register failed');
    }
  }

  deleteAr(String arId) async {
    try {
      await AccountRoleApi().deleteOne(arId);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Reject Artist Register failed');
    }
    ArtistRegisterPage.refresh();
    GoRouter.of(context).pop();
  }
}
