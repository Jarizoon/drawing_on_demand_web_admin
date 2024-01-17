// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountPage extends StatefulWidget {
  static dynamic state;
  const AccountPage({Key? key}) : super(key: key);
  @override
  State<AccountPage> createState() => _AccountPageState();
  static void refresh() {
    state.refresh();
  }
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController searchController = TextEditingController();
  late Future<Accounts?> accounts;
  String? search = "", statusToFilter = "", roleToFilter = "", status, role;
  int checkStatus = 0;
  @override
  void initState() {
    super.initState();
    AccountPage.state = this;
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
              List<Account> list = snapshot.data!.value.where((account) => account.name!.contains(search.toString()) || account.email!.contains(search.toString())).where((account) => account.accountRoles!.first.role!.name!.contains(roleToFilter.toString())).where((account) => account.status!.contains(statusToFilter.toString())).toList();
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Text('Accounts', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: MediaQuery.of(context).size.width >= 450,
                              child: Spacer(
                                flex: MediaQuery.of(context).size.width >= 1100 ? 2 : 1,
                              )),
                          Visibility(
                            visible: MediaQuery.of(context).size.width >= 850,
                            child: InkWell(
                              onTap: () => context.goNamed(CreateStaffRoute.name),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    const Text("Create Staff", style: TextStyle(fontSize: 16)),
                                    const SizedBox(width: 4),
                                    Container(
                                      child: const Icon(Icons.add),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
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
                          const SizedBox(width: 8),
                          Container(
                              width: 240,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(30)),
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
                                          style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                          hint: const Text('Status'),
                                          onChanged: (value) {
                                            setState(() {
                                              status = value;
                                            });
                                          },
                                          items: ["Active", "Deactive", "None"].map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
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
                                          style: const TextStyle(color: blackColor, backgroundColor: kWhite, fontSize: 12),
                                          hint: const Text('Role'),
                                          onChanged: (value) {
                                            setState(() {
                                              role = value;
                                            });
                                          },
                                          items: ["Customer", "Artist", "Staff", "Admin", "None"].map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (role != null) {
                                                if (role != "None") {
                                                  roleToFilter = role;
                                                } else {
                                                  roleToFilter = "";
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
                            columnSpacing: 10,
                            columns: const [
                              DataColumn(label: Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                              DataColumn(label: Text("Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                              DataColumn(label: Text("Phone", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                              DataColumn(label: Text("Role", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                              DataColumn(label: Text("Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                            ],
                            source: AccountData(context: context, list: list),
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
          },
        )),
      ),
    );
  }

  void refresh() {
    setState(() {
      accounts = getData();
    });
  }
}

class AccountData extends DataTableSource {
  final BuildContext context;
  final List<Account> list;
  AccountData({required this.context, required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list.length) {
      return null;
    }
    final account = list[index];
    return DataRow.byIndex(onLongPress: () => context.goNamed(AccountDetailRoute.name, pathParameters: {'account_id': account.id.toString()}), index: index, cells: [
      DataCell(Text("${account.email}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${account.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${account.phone}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${account.accountRoles!.first.role!.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      DataCell(Text("${account.status}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
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
