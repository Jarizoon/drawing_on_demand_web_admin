// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Artwork extends StatefulWidget {
  const Artwork({Key? key}) : super(key: key);

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  String? status, role;
  @override
  Widget build(BuildContext context) {
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
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: MediaQuery.of(context).size.width >= 650,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 150,
                          child: const Center(
                            child: Text('Artworks',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: kWhite)),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: MediaQuery.of(context).size.width >= 450,
                          child: Spacer(
                            flex: MediaQuery.of(context).size.width >= 1100
                                ? 2
                                : 1,
                          )),
                      Container(
                        width: 160,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Search'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {},
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
                        width: 240,
                        child: Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(30)),
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
                                    items: ["Active", "Deactive"]
                                        .map<DropdownMenuItem<String?>>((e) =>
                                            DropdownMenuItem(
                                                value: e,
                                                child: Text(e.toString())))
                                        .toList()),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String?>(
                                    value: role,
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
                                        role = value;
                                      });
                                    },
                                    items: [
                                      "Customer",
                                      "Artist",
                                      "Staff",
                                      "Admin"
                                    ]
                                        .map<DropdownMenuItem<String?>>((e) =>
                                            DropdownMenuItem(
                                                value: e,
                                                child: Text(e.toString())))
                                        .toList()),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: PaginatedDataTable(
                        dataRowMaxHeight: 100,
                        columnSpacing: 10,
                        columns: const [
                          DataColumn(
                              label: Text("Image",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700))),
                          DataColumn(
                              label: Text("Title",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700))),
                          DataColumn(
                              label: Text("Price",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700))),
                          DataColumn(
                              label: Text("Category",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700))),
                          DataColumn(
                              label: Text("Status",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700))),
                        ],
                        source: ArtworkData(context: context),
                        rowsPerPage: 5,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArtworkData extends DataTableSource {
  final BuildContext context;
  ArtworkData({required this.context});
  final List<Map<String, dynamic>> _data = List.generate(
      artworkDemo.length,
      (index) => {
            "image": artworkDemo[index].image,
            "title": artworkDemo[index].title,
            "price": artworkDemo[index].price,
            "category": artworkDemo[index].category,
            "status": artworkDemo[index].status
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.orderDetail, (route) => false,
            arguments: {_data[index]}),
        cells: [
          DataCell(Container(
              padding: const EdgeInsets.all(5),
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage("${_data[index]['image']}"),
                fit: BoxFit.contain,
              ))),
          DataCell(Text("${_data[index]['title']}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${_data[index]['price']}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${_data[index]['category']}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${_data[index]['status']}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
