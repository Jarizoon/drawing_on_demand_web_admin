// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);
  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  bool isDeactive = false;
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String isDeactiveString = "Activate";
    if (isDeactive) {
      isDeactiveString = "Deactivate";
    }
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(top: 18, left: 18),
                  height: 70,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text('Account Detail',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kWhite)),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: kWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  child: Image.asset(
                                                    emptyImage,
                                                    height: 200,
                                                    width: 200,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 35),
                                                    Text("$isDeactiveString:"),
                                                    const SizedBox(width: 10),
                                                    Switch(
                                                        value: isDeactive,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            isDeactive =
                                                                !isDeactive;
                                                          });
                                                        })
                                                  ],
                                                )
                                              ],
                                            )),
                                        const SizedBox(width: 20),
                                        Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                          "Name: $isDeactiveString",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                        "Email: $isDeactiveString",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                          "Role: $isDeactiveString",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                        "Status: $isDeactiveString",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                          "Phone: $isDeactiveString",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                        "Address: $isDeactiveString",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                          "Gender: $isDeactiveString",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                        "Created Date: $isDeactiveString",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                          "Bio: $isDeactiveString",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1180,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade500,
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ],
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
