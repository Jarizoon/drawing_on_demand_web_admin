import 'package:drawing_on_demand_web_admin/data/apis/category_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/discount_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/material_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/surface_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/category.dart';
import 'package:drawing_on_demand_web_admin/data/models/discount.dart';
import 'package:drawing_on_demand_web_admin/data/models/material.dart' as material;
import 'package:drawing_on_demand_web_admin/data/models/surface.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ManagementPage extends StatefulWidget {
  static dynamic state;
  const ManagementPage({Key? key}) : super(key: key);

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late Future<Categories?> categories;
  late Future<material.Materials?> materials;
  late Future<Surfaces?> surfaces;
  late Future<Discounts?> discounts;
  @override
  void initState() {
    super.initState();
    ManagementPage.state = this;
    categories = getCategories();
    materials = getMaterials();
    surfaces = getSurfaces();
    discounts = getDiscounts();
  }

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
          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
          child: Container(
            padding: const EdgeInsets.all(12),
            width: 1200,
            child: const Center(
              child: Text('Management', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
            ),
          ),
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: FutureBuilder(
                            future: categories,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
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
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Categories",
                                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => createCategory(context),
                                              );
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: secondaryColor),
                                              child: const Icon(
                                                Icons.add,
                                                color: kWhite,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      PaginatedDataTable(
                                        columnSpacing: 10,
                                        columns: const [
                                          DataColumn(label: Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                          DataColumn(label: Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                        ],
                                        source: CategoryData(context: context, list: snapshot.data!.value),
                                        rowsPerPage: 10,
                                      ),
                                    ]));
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );
                            }),
                      )),
                  Visibility(
                      visible: MediaQuery.of(context).size.width >= 650,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: FutureBuilder(
                                future: materials,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
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
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Materials",
                                                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => createMaterial(context),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: secondaryColor),
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: kWhite,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          PaginatedDataTable(
                                            columnSpacing: 10,
                                            columns: const [
                                              DataColumn(label: Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                              DataColumn(label: Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                            ],
                                            source: MaterialData(context: context, list: snapshot.data!.value),
                                            rowsPerPage: 10,
                                          ),
                                        ]));
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  );
                                }),
                          ))),
                  Visibility(
                      visible: MediaQuery.of(context).size.width >= 850,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: FutureBuilder(
                                future: surfaces,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
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
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Surfaces",
                                                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => createSurface(context),
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: secondaryColor),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: kWhite,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            PaginatedDataTable(
                                              columnSpacing: 10,
                                              columns: const [
                                                DataColumn(label: Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                                DataColumn(label: Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                              ],
                                              source: SurfaceData(context: context, list: snapshot.data!.value),
                                              rowsPerPage: 10,
                                            ),
                                          ],
                                        ));
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  );
                                }),
                          ))),
                  Visibility(
                    visible: MediaQuery.of(context).size.width >= 1300,
                    child: Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: FutureBuilder(
                              future: discounts,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
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
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Discounts",
                                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => createDiscount(context),
                                                );
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: secondaryColor),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: kWhite,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        PaginatedDataTable(
                                          columnSpacing: 10,
                                          columns: const [
                                            DataColumn(label: Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                            DataColumn(label: Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                          ],
                                          source: DiscountData(context: context, list: snapshot.data!.value),
                                          rowsPerPage: 10,
                                        ),
                                      ]));
                                }
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                );
                              }),
                        )),
                  )
                ],
              ),
            ))
      ],
    )))));
  }

  Future<Categories?> getCategories() async {
    try {
      return await CategoryApi().gets(0);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get categories failed');
    }
    return null;
  }

  Future<material.Materials?> getMaterials() async {
    try {
      return await MaterialApi().gets(0);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get categories failed');
    }
    return null;
  }

  Future<Surfaces?> getSurfaces() async {
    try {
      return await SurfaceApi().gets(0);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get categories failed');
    }
    return null;
  }

  Future<Discounts?> getDiscounts() async {
    try {
      return await DiscountApi().gets(0);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Get categories failed');
    }
    return null;
  }

  void refresh() {
    setState(() {
      categories = getCategories();
      materials = getMaterials();
      surfaces = getSurfaces();
      discounts = getDiscounts();
    });
  }
}

class CategoryData extends DataTableSource {
  final BuildContext context;
  final List<Category?> list;
  CategoryData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final category = list[index];
    return DataRow(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => categoryDetails(context, category),
          );
        },
        cells: [
          DataCell(Text("${category!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${category.description}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

class MaterialData extends DataTableSource {
  final BuildContext context;
  final List<material.Material?> list;
  MaterialData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final ma = list[index];
    return DataRow(cells: [
      DataCell(Text("${ma!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${ma.description}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

class SurfaceData extends DataTableSource {
  final BuildContext context;
  final List<Surface?> list;
  SurfaceData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final surface = list[index];
    return DataRow(cells: [
      DataCell(Text("${surface!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${surface.description}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

class DiscountData extends DataTableSource {
  final BuildContext context;
  final List<Discount?> list;
  DiscountData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final discount = list[index];
    return DataRow(cells: [
      DataCell(Text("${discount!.discountPercent! * 100}%", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${DateFormat("yyyy-MM-dd").format(discount.startDate!)} - ${DateFormat("yyyy-MM-dd").format(discount.endDate!)}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

AlertDialog createCategory(BuildContext context) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
      title: const Text('Create Category'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter description',
            ),
          ),
        ],
      ));
}

AlertDialog categoryDetails(BuildContext context, Category category) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
            context: context,
            builder: (context) => updateCategory(context, category),
          );
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
      title: const Text('Category details'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.name!),
          Row(
            children: [
              Expanded(flex: 1, child: Text(category.description!))
            ],
          )
          
        ],
      ));
}

AlertDialog updateCategory(BuildContext context, Category category) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Submit'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
      title: const Text('Update Category'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.name!),
          TextFormField(
            decoration:  InputDecoration(
              hintText: "${category.description}",
            ),
          ),
          
        ],
      ));
}



AlertDialog createMaterial(BuildContext context) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
      title: const Text('Create Material'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter description',
            ),
          ),
        ],
      ));
}

AlertDialog createSurface(BuildContext context) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
      title: const Text('Create Surface'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter description',
            ),
          ),
        ],
      ));
}

AlertDialog createDiscount(BuildContext context) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
      title: const Text('Create Discount'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter number',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter discount precent',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter start date',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter end date',
            ),
          ),
        ],
      ));
}
