// ignore_for_file: sized_box_for_whitespace
import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/core/utils/validation_function.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(visible: MediaQuery.of(context).size.width >= 1100, child: const SizedBox(width: 30)),
          Visibility(
            visible: MediaQuery.of(context).size.width >= 850,
            child: Center(
              child: Text('Drawing On Demand', style: kTextStyle.copyWith(fontWeight: FontWeight.w400, color: kWhite, fontSize: 24)),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: thirdColor, borderRadius: BorderRadius.all(Radius.circular(18.0))),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: const Center(
                    child: Image(image: AssetImage(profileIcon)),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Admin', style: kTextStyle.copyWith(fontWeight: FontWeight.w400, color: kWhite)),
                  ),
                ),
                Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(fontSize: 15),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: kWhite,
                      ),
                      items: const [DropdownMenuItem(value: 'Change Password', child: Text('Change Password')), DropdownMenuItem(value: 'Log Out', child: Text('Log Out'))],
                      onChanged: (value) {
                        switch (value) {
                          case 'Change Password':
                            final formKey = GlobalKey<FormState>();
                            TextEditingController passwordController = TextEditingController();
                            TextEditingController newPasswordController = TextEditingController();
                            TextEditingController confirmNewPasswordController = TextEditingController();
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                if (!formKey.currentState!.validate()) {
                                                  return;
                                                } else {
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              child: const Text("Submit"))
                                        ],
                                        title: Container(
                                          height: 40,
                                          color: kPrimaryColor,
                                          child: const Center(
                                            child: Text('Change password'),
                                          ),
                                        ),
                                        titlePadding: const EdgeInsets.all(0),
                                        contentPadding: const EdgeInsets.all(20),
                                        content: Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                decoration: const InputDecoration(
                                                  hintText: "Enter your password",
                                                ),
                                                controller: passwordController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter your password';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              TextFormField(
                                                decoration: const InputDecoration(
                                                  hintText: "Enter new password",
                                                ),
                                                controller: newPasswordController,
                                                validator: (value) {
                                                  if (!isValidPassword(value!)) {
                                                    return 'Please enter a valid password';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              TextFormField(
                                                decoration: const InputDecoration(
                                                  hintText: "Enter confirm new password",
                                                ),
                                                controller: confirmNewPasswordController,
                                                validator: (value) {
                                                  if (value!.isEmpty || value != newPasswordController.text.trim()) {
                                                    return 'Please enter a confirm password be similar to password';
                                                  }
                                                  return null;
                                                },
                                              )
                                            ],
                                          ),
                                        )));
                            break;
                          case 'Log Out':
                            context.goNamed(LoginRoute.name);
                            break;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
