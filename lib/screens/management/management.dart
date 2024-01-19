// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:drawing_on_demand_web_admin/core/utils/validation_function.dart';
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
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:validators/validators.dart';

class ManagementPage extends StatefulWidget {
  static dynamic state;
  const ManagementPage({Key? key}) : super(key: key);

  @override
  State<ManagementPage> createState() => _ManagementPageState();
  static void refresh() {
    state.refresh();
  }
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
                      flex: 2,
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
                          flex: 2,
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
                          flex: 2,
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
                    // visible: MediaQuery.of(context).size.width >= 1385,
                    child: Expanded(
                        flex: 3,
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
                                            DataColumn(label: Text("Discount %", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                            DataColumn(label: Text("Start", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                                            DataColumn(label: Text("End", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
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
    return DataRow(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => materialDetails(context, ma),
          );
        },
        cells: [
          DataCell(Text("${ma!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
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
    return DataRow(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => surfaceDetails(context, surface),
          );
        },
        cells: [
          DataCell(Text("${surface!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
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
    return DataRow(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => discountDetails(context, discount),
          );
        },
        cells: [
          DataCell(Text("${discount!.discountPercent! * 100}%", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text(DateFormat("yyyy-MM-dd").format(discount.startDate!), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text(DateFormat("yyyy-MM-dd").format(discount.endDate!), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
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
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await createCategoryAPI(Category(id: Guid.newGuid, name: nameController.text, description: descriptionController.text));
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create'),
        ),
      ],
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Create Category'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter category name',
                ),
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Category Details'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Name: ${category.name!}"),
          Container(
            width: 400,
            child: Row(
              children: [Expanded(flex: 1, child: Text("Description: ${category.description!}"))],
            ),
          )
        ],
      ));
}

AlertDialog updateCategory(BuildContext context, Category category) {
  final formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await updateCategoryAPI(category.id.toString(), descriptionController.text);
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Update Category'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(category.name!),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "${category.description}",
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog createMaterial(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await createMaterialAPI(material.Material(id: Guid.newGuid, name: nameController.text, description: descriptionController.text));
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create'),
        ),
      ],
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Create Material'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a material name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog materialDetails(BuildContext context, material.Material material) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => updateMaterial(context, material),
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Category Details'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Name: ${material.name!}"),
          Container(
            width: 400,
            child: Row(
              children: [Expanded(flex: 1, child: Text("Description: ${material.description!}"))],
            ),
          )
        ],
      ));
}

AlertDialog updateMaterial(BuildContext context, material.Material material) {
  final formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await updateMaterialAPI(material.id.toString(), descriptionController.text);
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Update Material'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(material.name!),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "${material.description}",
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog createSurface(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await createSurfaceAPI(Surface(id: Guid.newGuid, name: nameController.text, description: descriptionController.text));
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create'),
        ),
      ],
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Create Surface'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a surface name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog surfaceDetails(BuildContext context, Surface surface) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => updateSurface(context, surface),
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Surface Details'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Name: ${surface.name!}"),
          Container(
            width: 400,
            child: Row(
              children: [Expanded(flex: 1, child: Text("Description: ${surface.description!}"))],
            ),
          )
        ],
      ));
}

AlertDialog updateSurface(BuildContext context, Surface surface) {
  final formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await updateSurfaceAPI(surface.id.toString(), descriptionController.text);
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Update Surface'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(surface.name!),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "${surface.description}",
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog createDiscount(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController discountPercentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await createDiscountAPI(Discount(id: Guid.newGuid, number: int.parse(numberController.text), discountPercent: double.parse(discountPercentController.text), startDate: DateTime.parse(startDateController.text), endDate: DateTime.parse(endDateController.text), status: 'Active'));
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create'),
        ),
      ],
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Create Discount'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter number of artworks to applied discount',
                ),
                controller: numberController,
                validator: (value) {
                  if (!is1to10(value)) {
                    return 'Please input a number from 1 to 10';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter discount percent',
                ),
                controller: discountPercentController,
                validator: (value) {
                  if (!is1to100percent(value)) {
                    return 'Please input discount percent form 0.01 to 1';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter start date',
                ),
                controller: startDateController,
                validator: (value) {
                  if (!isAfter(value!)) {
                    return 'Please input valid date and after today';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter end date',
                ),
                controller: endDateController,
                validator: (value) {
                  if (!isAfter(value!, startDateController.text)) {
                    return 'Please input valid date and after start day';
                  }
                  return null;
                },
              ),
            ],
          )));
}

AlertDialog discountDetails(BuildContext context, Discount discount) {
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => updateDiscount(context, discount),
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Discount Details'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Number of artworks to applied discount: ${discount.number}"),
          Text("Discount Percent: ${discount.discountPercent! * 100}%"),
          Text("Start Date: ${DateFormat("yyyy-MM-dd").format(discount.startDate!)}"),
          Text("End Date: ${DateFormat("yyyy-MM-dd").format(discount.endDate!)}"),
        ],
      ));
}

AlertDialog updateDiscount(BuildContext context, Discount discount) {
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController discountPercentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int number = discount.number!;
  double per = discount.discountPercent!;
  DateTime start = discount.startDate!;
  DateTime end = discount.endDate!;
  return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            } else {
              await updateDiscountAPI(discount.id.toString(), number, per, start, end);
              ManagementPage.refresh();
              Navigator.of(context).pop();
            }
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
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Update Discount'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Number: $number",
                ),
                controller: numberController,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (!is1to10(value)) {
                      return 'Please input a number from 1 to 10';
                    }
                    number = int.parse(numberController.text);
                  }
                  return null;
                },
              ),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Discount Percent: ${per * 100}%",
                  ),
                  controller: discountPercentController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (!is1to100percent(value)) {
                        return 'Please input discount percent form 0.01 to 1';
                      }
                      per = double.parse(discountPercentController.text);
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Start Date: ${DateFormat('yyyy-MM-dd').format(start)}',
                  ),
                  controller: startDateController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (!isAfter(value)) {
                        return 'Please input valid date and after today';
                      }
                      start = DateTime.parse(startDateController.text);
                    }
                    return null;
                  }),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'End Date: ${DateFormat('yyyy-MM-dd').format(end)}',
                ),
                controller: endDateController,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (!isAfter(value, start)) {
                      return 'Please input valid date and after start day';
                    }
                    end = DateTime.parse(endDateController.text);
                  }
                  return null;
                },
              ),
            ],
          )));
}

createMaterialAPI(material.Material material) async {
  try {
    await MaterialApi().postOne(material);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Create failed');
  }
}

createSurfaceAPI(Surface surface) async {
  try {
    await SurfaceApi().postOne(surface);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Create failed');
  }
}

createCategoryAPI(Category category) async {
  try {
    await CategoryApi().postOne(category);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Create failed');
  }
}

createDiscountAPI(Discount discount) async {
  try {
    await DiscountApi().postOne(discount);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Create failed');
  }
}

updateCategoryAPI(String id, String description) async {
  try {
    await CategoryApi().patchOne(id, {'Description': description});
  } catch (e) {
    Fluttertoast.showToast(msg: 'Update failed');
  }
}

updateMaterialAPI(String id, String description) async {
  try {
    await MaterialApi().patchOne(id, {'Description': description});
  } catch (e) {
    Fluttertoast.showToast(msg: 'Update failed');
  }
}

updateSurfaceAPI(String id, String description) async {
  try {
    await SurfaceApi().patchOne(id, {'Description': description});
  } catch (e) {
    Fluttertoast.showToast(msg: 'Update failed');
  }
}

updateDiscountAPI(String id, int number, double percent, DateTime startDate, DateTime endDate) async {
  try {
    await DiscountApi().patchOne(id, {
      'Number': number, 
      'DiscountPercent': percent, 
      'StartDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(startDate), 
      'EndDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(endDate)
      });
  } catch (e) {
    Fluttertoast.showToast(msg: 'Update failed');
  }
}
