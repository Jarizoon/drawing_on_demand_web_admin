// ignore_for_file: sized_box_for_whitespace
import 'package:drawing_on_demand_web_admin/data/apis/proposal_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/requirement_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/requirement/components/proposal_list.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RequirementDetailPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const RequirementDetailPage({Key? key, this.id}) : super(key: key);
  @override
  State<RequirementDetailPage> createState() => _RequirementDetailPage();
  static void refresh() {
    state.refresh();
  }
}

class _RequirementDetailPage extends State<RequirementDetailPage> {
  late Future<Requirement?> req;
  @override
  void initState() {
    super.initState();
    RequirementDetailPage.state = this;
    req = getData();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: req,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String status = snapshot.data!.status!;
                    String headStatus = "Private";
                    if(status.contains("Public")){
                      headStatus = "Public";
                    }
                    String image = emptyImage;
                    if (snapshot.data!.image != null && snapshot.data!.image != "") {
                      image = snapshot.data!.image.toString();
                    }
                    String size = "None";
                    if (snapshot.data!.sizes!.isNotEmpty) {
                      size = "${snapshot.data!.sizes!.first.width} x ${snapshot.data!.sizes!.first.length}";
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
                            child: const Text('Requirement Detail', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                              visible: !status.contains("Deactive"),
                                                              child: Center(
                                                                child: TextButton(
                                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                                                  child: const Text("Deactivate", style: TextStyle(color: kWhite)),
                                                                  onPressed: () async {
                                                                    await updateStatus(snapshot.data!.id.toString(), "$headStatus|Deactive");
                                                                    await updateProposalsStatus(snapshot.data!, "Reject");
                                                                    RequirementDetailPage.refresh();
                                                                  },
                                                                ),
                                                              )),
                                                          Visibility(
                                                              visible: status.contains("Deactive"),
                                                              child: Center(
                                                                child: TextButton(
                                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                                  child: const Text("Activate", style: TextStyle(color: kWhite)),
                                                                  onPressed: () async {
                                                                    await updateStatus(snapshot.data!.id.toString(), headStatus);
                                                                    RequirementDetailPage.refresh();
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
                                                          Text("${snapshot.data!.title}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                width: 300,
                                                                child: Text("Budget: ${snapshot.data!.budget}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                              ),
                                                              const SizedBox(width: 20),
                                                              Text("Category: ${snapshot.data!.category!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(width: 300, child: Text("Pieces: ${snapshot.data!.pieces}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Text("Size: $size", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(width: 300, child: Text("Surface: ${snapshot.data!.surface!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const SizedBox(width: 20),
                                                              Text("Material: ${snapshot.data!.material!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(width: 320, child: Text("Status: ${snapshot.data!.status}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                              const Text("Create By: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                              Text("${snapshot.data!.createdByNavigation!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Text("Decription: ${snapshot.data!.description}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                              width: 1150,
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
                                              child: ProposalList(requirement: snapshot.data),
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

  Future<Requirement?> getData() async {
    try {
      return await RequirementApi().getOne(widget.id!, 'category,createdByNavigation,material,surface,sizes,proposals(expand=createdByNavigation,artwork(expand=arts))');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get requirements failed');
    }
    return null;
  }

  void refresh() {
    setState(() {
      req = getData();
    });
  }

  Future<void> updateStatus(String requirementId, String status) async {
    try {
      return await RequirementApi().patchOne(requirementId, {'Status': status});
    } catch (error) {
      Fluttertoast.showToast(msg: 'Update requirement status failed');
    }
  }

  Future<void> updateProposalsStatus(Requirement requirement, String status) async {
    try {
      if (requirement.proposals != null) {
        for (var i = 0; i < requirement.proposals!.length; i++) {
          await ProposalApi().patchOne(requirement.proposals![i].id.toString(), {'Status': status});
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Update proposals status failed');
    }
  }
}
