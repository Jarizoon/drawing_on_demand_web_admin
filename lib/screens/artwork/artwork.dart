// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/data/apis/artwork_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/category_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtworkPage extends StatefulWidget {
  static dynamic state;
  const ArtworkPage({Key? key}) : super(key: key);

  @override
  State<ArtworkPage> createState() => _ArtworkPageState();

  static void refresh() {
    state.refresh();
  }
}

class _ArtworkPageState extends State<ArtworkPage> {
  TextEditingController searchController = TextEditingController();
  late Future<Artworks?> artworks;
  String? search = "", statusToFilter = "", categoryToFilter = "", status, category;
  @override
  void initState() {
    super.initState();
    ArtworkPage.state = this;
    artworks = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: FutureBuilder(
              future: artworks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Artwork> list = snapshot.data!.value.where((artwork) => artwork.title!.contains(search.toString()) || artwork.title!.toLowerCase().contains(search.toString())).where((artwork) => artwork.status!.contains(statusToFilter.toString())).where((artwork) => artwork.category!.name!.contains(categoryToFilter.toString())).toList();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: MediaQuery.of(context).size.width >= 650,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: 150,
                                  child: const Center(
                                    child: Text('Artworks', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: MediaQuery.of(context).size.width >= 450,
                                  child: Spacer(
                                    flex: MediaQuery.of(context).size.width >= 1100 ? 2 : 1,
                                  )),
                              Container(
                                width: 160,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        decoration: const InputDecoration(hintText: 'Search'),
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
                              const SizedBox(width: 12),
                              Container(
                                width: 340,
                                child: Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 3,
                                        child: DropdownButton<String?>(
                                            value: status,
                                            icon: Image.asset(
                                              dropdownIcon,
                                              width: 15,
                                              height: 15,
                                            ),
                                            style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                            hint: const Text('Status'),
                                            onChanged: (value) {
                                              setState(() {
                                                status = value;
                                              });
                                            },
                                            items: ["Available", "Not Available", "Paused", "Proposed", "None"].map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                          flex: 4,
                                          child: FutureBuilder(
                                              future: getCategoryNames(),
                                              builder: ((context, snapshot) {
                                                if (snapshot.hasData) {
                                                  List<String> categoryNames = snapshot.data!.toList();
                                                  return DropdownButton<String?>(
                                                      value: category,
                                                      icon: Image.asset(
                                                        dropdownIcon,
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                                      hint: const Text('Category'),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          category = value;
                                                        });
                                                      },
                                                      items: categoryNames.map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList());
                                                }
                                                return Container(color: kWhite, width: 70);
                                              }))),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (category != null) {
                                                  if (category != "None") {
                                                    categoryToFilter = category;
                                                  } else {
                                                    categoryToFilter = "";
                                                  }
                                                }
                                                if (status != null) {
                                                  if (status != "None") {
                                                    statusToFilter = status;
                                                  } else {
                                                    statusToFilter = "";
                                                  }
                                                }
                                              });
                                            },
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
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: PaginatedDataTable(
                                dataRowMaxHeight: 100,
                                columnSpacing: 10,
                                columns: const [
                                  DataColumn(label: Text("Image", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                  DataColumn(label: Text("Title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                  DataColumn(label: Text("Price", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                  DataColumn(label: Text("Category", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                  DataColumn(label: Text("Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                ],
                                source: ArtworkData(context: context, list: list),
                                rowsPerPage: 5,
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
              }),
        ),
      ),
    );
  }

  Future<Artworks?> getData() async {
    try {
      return await ArtworkApi().gets(0, expand: 'category,arts');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get artworks failed');
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

  void refresh() {
    setState(() {
      artworks = getData();
    });
  }
}

class ArtworkData extends DataTableSource {
  final List<Artwork> list;
  final BuildContext context;
  ArtworkData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final artwork = list[index];
    String image = "";
    if (artwork.arts!.isEmpty) {
      image = emptyImage;
    } else {
      image = artwork.arts![0].image.toString();
    }
    return DataRow(onLongPress: () => context.goNamed(ArtworkDetailRoute.name, pathParameters: {'artwork_id': artwork.id.toString()}), cells: [
      DataCell(Container(
          padding: const EdgeInsets.all(5),
          width: 100,
          height: 100,
          child: Image(
            image: NetworkImage(image),
            fit: BoxFit.contain,
          ))),
      DataCell(Text("${artwork.title}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${artwork.price}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${artwork.category!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${artwork.status}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}
