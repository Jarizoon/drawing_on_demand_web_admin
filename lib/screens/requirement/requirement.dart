// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/apis/category_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/requirement_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RequirementList extends StatefulWidget {
  static dynamic state;
  const RequirementList({Key? key}) : super(key: key);

  @override
  State<RequirementList> createState() => _RequirementListState();
}

class _RequirementListState extends State<RequirementList> {
  TextEditingController searchController = TextEditingController();
  late Future<Requirements?> requirements;
  String? search = "",
      statusToFilter = "",
      categoryToFilter = "",
      status,
      category;
  @override
  void initState() {
    super.initState();
    RequirementList.state = this;
    requirements = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: requirements,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Requirement> list = snapshot.data!.value
                        .where((requirement) =>
                            requirement.title!.contains(search.toString()))
                        .where((requirement) => requirement.status!
                            .contains(statusToFilter.toString()))
                        .where((requirement) => requirement.category!.name!
                            .contains(categoryToFilter.toString()))
                        .toList();
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 70,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible:
                                      MediaQuery.of(context).size.width >= 700,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    width: 200,
                                    child: const Center(
                                      child: Text('Requirements',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color: kWhite)),
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible:
                                        MediaQuery.of(context).size.width >=
                                            450,
                                    child: Spacer(
                                      flex: MediaQuery.of(context).size.width >=
                                              1100
                                          ? 2
                                          : 1,
                                    )),
                                Visibility(
                                  visible: MediaQuery.of(context).size.width >= 630,
                                  child:Container(
                                  width: 160,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              hintText: 'Search'),
                                          controller: searchController,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                search = searchController.text;
                                              });
                                            },
                                            icon: Image.asset(
                                              searchIcon,
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    ],
                                  ),
                                ), 
                                  ),
                                const SizedBox(width: 12),
                                Container(
                                  width: 400,
                                  child: Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: kWhite,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Expanded(
                                          flex: 2,
                                          child: DropdownButton<String?>(
                                              value: status,
                                              icon: Image.asset(
                                                dropdownIcon,
                                                width: 15,
                                                height: 15,
                                              ),
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  backgroundColor: kWhite,
                                                  fontSize: 12),
                                              hint: const Text('Status'),
                                              onChanged: (value) {
                                                setState(() {
                                                  status = value;
                                                });
                                              },
                                              items: [
                                                "Pending",
                                                "Private",
                                                "Public",
                                                "Not Available",
                                                "Accepted",
                                                "Meeted",
                                                "Processing",
                                                "Finished",
                                                "None"
                                              ]
                                                  .map<
                                                      DropdownMenuItem<
                                                          String?>>((e) =>
                                                      DropdownMenuItem(
                                                          value: e,
                                                          child: Text(
                                                              e.toString())))
                                                  .toList()),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          flex: 3,
                                          child: FutureBuilder(future: getCategoryNames(), builder: ((context, snapshot) {
                                            if(snapshot.hasData){
                                              List<String> categoryNames = snapshot.data!.toList();
                                              return DropdownButton<String?>(
                                              value: category,
                                              icon: Image.asset(
                                                dropdownIcon,
                                                width: 15,
                                                height: 15,
                                              ),
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  backgroundColor: kWhite,
                                                  fontSize: 12),
                                              hint: const Text('Category'),
                                              onChanged: (value) {
                                                setState(() {
                                                  category = value;
                                                });
                                              },
                                              items: categoryNames
                                                  .map<
                                                      DropdownMenuItem<
                                                          String?>>((e) =>
                                                      DropdownMenuItem(
                                                          value: e,
                                                          child: Text(
                                                              e.toString())))
                                                  .toList());
                                            } 
                                            return Container(color: kWhite, width: 70);
                                          }))

                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                filterIcon,
                                                fit: BoxFit.cover,
                                              )),
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: kWhite,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: PaginatedDataTable(
                                  columnSpacing: 10,
                                  columns: const [
                                    DataColumn(
                                        label: Text("Title",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Owner",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Category",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Budget",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Status",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                  source: RequirementData(
                                      context: context, list: list),
                                  rowsPerPage: 10,
                                ),
                              )),
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
}

class RequirementData extends DataTableSource {
  final BuildContext context;
  final List<Requirement> list;
  RequirementData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final requirement = list[index];
    return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.requirementDetail, (route) => false,
            arguments: {requirement}),
        cells: [
          DataCell(Text("${requirement.title}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${requirement.createdByNavigation!.name}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${requirement.category!.name}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${requirement.budget}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${requirement.status}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

Future<Requirements?> getData() async {
  try {
    return await RequirementApi().gets(0, expand: 'category,createdByNavigation'); 
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get requirements failed');
  }
  return null;
}

Future<List<String>> getCategoryNames() async {
  List<String> list = [];
  try {
    var categories = await CategoryApi().gets(0);
    for (var i = 0; i < categories.value.length; i++) {
      list.add(categories.value[i].name.toString());
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get category names failed');
  }
  return list;
}
