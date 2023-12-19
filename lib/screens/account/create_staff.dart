import 'dart:typed_data';

import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateStaff extends StatefulWidget {
  const CreateStaff({Key? key}) : super(key: key);
  @override
  State<CreateStaff> createState() => _CreateStaffState();
}

class _CreateStaffState extends State<CreateStaff> {
  late bool imageAvailable = false;
  late Uint8List imageFile;
  String gender = "Female";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    child: const Center(
                      child: Text('Create Staff',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: kWhite)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    height: 550,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Email',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your email',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Fullname',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your fullname',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Phone',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your phone number',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                height: 50,
                                child: Row(
                                  children: [
                                    const Text("Choose your gender:",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                    const SizedBox(width: 20),
                                    Radio(
                                        value: "Female",
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        }),
                                    const Text("Female",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black)),
                                    const SizedBox(width: 30),
                                    Radio(
                                        value: "Male",
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        }),
                                    const Text("Male",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black)),
                                    const SizedBox(width: 30),
                                    Radio(
                                        value: "Other",
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        }),
                                    const Text("Other",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Address',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your address',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Bio',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your introduction',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Password',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your password',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: kNeutralColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Confirm password',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kNeutralColor),
                                  hintText: 'Enter your password again',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kLightNeutralColor),
                                  focusColor: kNeutralColor,
                                  border: const OutlineInputBorder(),
                                ),
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
                                const SizedBox(height: 12),
                                const Text("Avatar",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: kWhite,
                                  ),
                                  child: imageAvailable
                                      ? Image.memory(imageFile)
                                      : Image.asset(emptyImage),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final image =
                                        await ImagePickerWeb.getImageAsBytes();
                                    setState(() {
                                      imageFile = image!;
                                      imageAvailable = true;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: kWhite,
                                        border: Border.all(
                                            width: 1.0, color: blackColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Text("Choose image",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                const SizedBox(height: 100),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        border: Border.all(
                                            width: 1.0, color: blackColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Text("Submit",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}
