import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtistRegisterList extends StatefulWidget {
  static dynamic state;
  const ArtistRegisterList({Key? key}) : super(key: key);

  @override
  State<ArtistRegisterList> createState() => _ArtistRegisterListState();
}

class _ArtistRegisterListState extends State<ArtistRegisterList> {
  late Future<Accounts?> accounts;
  @override
  void initState() {
    super.initState();
    ArtistRegisterList.state = this;
    accounts = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: accounts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Account> list = snapshot.data!.value
                    .where((account) => account.accountRoles!.last.role!.name == "Artist" && account.accountRoles!.last.status == "Pending")
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
                                      MediaQuery.of(context).size.width >= 650,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    width: 250,
                                    child: const Center(
                                      child: Text('Artist Registers',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color: kWhite)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
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
                                        label: Text("Email",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Name",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Phone",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Gender",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700))),
                                    DataColumn(
                                        label: Text("Address",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                  source: ArtistRegisterData(
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

class ArtistRegisterData extends DataTableSource {
  final BuildContext context;
  final List<Account> list;
  ArtistRegisterData({required this.context, required this.list});

  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final account = list[index];
    return DataRow(
        onLongPress: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.artistRegisterDetail, (route) => false,
            arguments: {account}),
        cells: [
          DataCell(Text("${account.email}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${account.name}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${account.phone}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${account.gender}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          DataCell(Text("${account.address}",
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

Future<Accounts?> getData() async {
  try {
    return await AccountApi().gets(0, expand: 'accountRoles(expand=role)');
  } catch (e) {
    Fluttertoast.showToast(msg: 'Get accounts failed');
  }
  return null;
}
