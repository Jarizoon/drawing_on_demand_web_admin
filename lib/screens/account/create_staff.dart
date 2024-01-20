// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings
import 'dart:typed_data';

import 'package:drawing_on_demand_web_admin/core/utils/validation_function.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_role_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/account_role.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/account/account.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:validators/validators.dart';

class CreateStaffPage extends StatefulWidget {
  const CreateStaffPage({Key? key}) : super(key: key);
  @override
  State<CreateStaffPage> createState() => _CreateStaffPageState();
}

class _CreateStaffPageState extends State<CreateStaffPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  FocusNode one = FocusNode();
  FocusNode two = FocusNode();
  FocusNode three = FocusNode();
  FocusNode four = FocusNode();
  FocusNode five = FocusNode();
  FocusNode six = FocusNode();
  FocusNode seven = FocusNode();
  bool hidePassword = true;
  String image = emptyImage;
  Uint8List? imageInBytes;

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
                  decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    child: const Center(
                      child: Text('Create Staff', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    height: 550,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      TextFormField(
                                        focusNode: one,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(two);
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: kNeutralColor,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Email',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter email',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                        ),
                                        controller: emailController,
                                        validator: (value) {
                                          if (!isEmail(value!)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: two,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(three);
                                        },
                                        keyboardType: TextInputType.name,
                                        cursorColor: kNeutralColor,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Fullname',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter fullname',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                        ),
                                        controller: fullnameController,
                                        validator: (value) {
                                          if (!isFullname(value!)) {
                                            return 'Please enter a valid fullname';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: three,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(four);
                                        },
                                        keyboardType: TextInputType.phone,
                                        cursorColor: kNeutralColor,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Phone',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter phone number',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                        ),
                                        controller: phoneController,
                                        validator: (value) {
                                          if (!isPhone(value!)) {
                                            return 'Please enter a valid phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 18.0),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        height: 50,
                                        child: Row(
                                          children: [
                                            const Text("Choose gender:", style: TextStyle(fontSize: 16, color: Colors.black)),
                                            const SizedBox(width: 20),
                                            Radio(
                                                value: "Female",
                                                groupValue: gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gender = value!;
                                                  });
                                                }),
                                            const Text("Female", style: TextStyle(fontSize: 12, color: Colors.black)),
                                            const SizedBox(width: 30),
                                            Radio(
                                                value: "Male",
                                                groupValue: gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gender = value!;
                                                  });
                                                }),
                                            const Text("Male", style: TextStyle(fontSize: 12, color: Colors.black)),
                                            const SizedBox(width: 30),
                                            Radio(
                                                value: "Other",
                                                groupValue: gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gender = value!;
                                                  });
                                                }),
                                            const Text("Other", style: TextStyle(fontSize: 12, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: four,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(five);
                                        },
                                        keyboardType: TextInputType.text,
                                        cursorColor: kNeutralColor,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Address',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter your address',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                        ),
                                        controller: addressController,
                                        validator: (value) {
                                          if (!isAddress(value!)) {
                                            return 'Please enter a address';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: five,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(six);
                                        },
                                        keyboardType: TextInputType.text,
                                        cursorColor: kNeutralColor,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Bio',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter your introduction',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                        ),
                                        controller: bioController,
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: six,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(seven);
                                        },
                                        keyboardType: TextInputType.visiblePassword,
                                        cursorColor: kNeutralColor,
                                        obscureText: hidePassword,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Password',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter your password',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                hidePassword = !hidePassword;
                                              });
                                            },
                                            icon: Icon(
                                              hidePassword ? Icons.visibility_off : Icons.visibility,
                                              color: kLightNeutralColor,
                                            ),
                                          ),
                                        ),
                                        controller: passwordController,
                                        validator: (value) {
                                          if (!isValidPassword(value!)) {
                                            return 'Please enter a valid password';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 18.0),
                                      TextFormField(
                                        focusNode: seven,
                                        keyboardType: TextInputType.visiblePassword,
                                        cursorColor: kNeutralColor,
                                        obscureText: hidePassword,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'Confirm password',
                                          labelStyle: kTextStyle.copyWith(color: kNeutralColor),
                                          hintText: 'Enter your password again',
                                          hintStyle: kTextStyle.copyWith(color: kLightNeutralColor),
                                          focusColor: kNeutralColor,
                                          border: const OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                hidePassword = !hidePassword;
                                              });
                                            },
                                            icon: Icon(
                                              hidePassword ? Icons.visibility_off : Icons.visibility,
                                              color: kLightNeutralColor,
                                            ),
                                          ),
                                        ),
                                        controller: confirmPasswordController,
                                        validator: (value) {
                                          if (value!.isEmpty || value != passwordController.text.trim()) {
                                            return 'Please enter a confirm password be similar to password';
                                          }
                                          return null;
                                        },
                                      )
                                    ],
                                  ),
                                ))),
                        Visibility(
                          visible: MediaQuery.of(context).size.width >= 850,
                          child: Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 12),
                                const Text("Avatar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: kWhite,
                                  ),
                                  child: imageInBytes == null
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(image),
                                          backgroundColor: kWhite,
                                        )
                                      : Image.memory(imageInBytes!),
                                ),
                                InkWell(
                                  onTap: () async {
                                    imageInBytes = await ImagePickerWeb.getImageAsBytes();
                                    setState(() {
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 15),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(color: kWhite, border: Border.all(width: 1.0, color: blackColor), borderRadius: BorderRadius.circular(30)),
                                    child: const Text("Choose image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                const SizedBox(height: 100),
                                InkWell(
                                  onTap: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    if (imageInBytes != null) {
                                      // image = await uploadImage(pickedFile!);
                                      image = await uploadFile(imageInBytes!);
                                    } else {
                                      image = 'https://firebasestorage.googleapis.com/v0/b/drawing-on-demand.appspot.com/o/images%2Fdrawing_on_demand.jpg?alt=media&token=c1801df1-f2d7-485d-8715-9e7aed83c3cf';
                                    }
                                    Guid accountId = Guid.newGuid;
                                    createStaff(Account(id: accountId, email: emailController.text, name: fullnameController.text, phone: phoneController.text, address: addressController.text, bio: bioController.text, status: 'Active', gender: gender, createdDate: DateTime.now(), lastModifiedDate: DateTime.now(), availableConnect: 0, avatar: image),
                                        AccountRole(id: Guid.newGuid, roleId: Guid('cc6e98e9-b8ec-46bc-9b37-0bd3c35b41d7'), accountId: accountId, addedDate: DateTime.now(), status: 'Active'));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 15),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(color: kPrimaryColor, border: Border.all(width: 1.0, color: blackColor), borderRadius: BorderRadius.circular(30)),
                                    child: const Text("Submit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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

  createStaff(Account account, AccountRole ar) async {
    try {
      var accounts = await AccountApi().gets(0, filter: "email eq '${emailController.text.trim()}'");
      if (accounts.value.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Existed Email');
        return;
      }
      await AccountApi().postOne(account);
      await AccountRoleApi().postOne(ar);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      AccountPage.refresh();
      GoRouter.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Create Staff failed');
    }
  }

  Future<String> uploadImage(XFile image) async {
    const String folder = 'images/';

    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child(folder + image.name);

    var data = await image.readAsBytes();

    try {
      await imageRef.putData(data, SettableMetadata(contentType: image.mimeType));
    } catch (error) {
      rethrow;
    }

    return imageRef.getDownloadURL();
  }

  Future<String> uploadFile(Uint8List imageInBytes) async {
    String imageUrl = '';
    try {
      UploadTask uploadTask;

      Reference ref = FirebaseStorage.instance
          .ref()
          .child('images/' + Guid.newGuid.toString());

      final metadata =
          SettableMetadata(contentType: 'image/png');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(imageInBytes, metadata);

      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return imageUrl;
  }
}
