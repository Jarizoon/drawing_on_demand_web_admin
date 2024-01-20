// ignore_for_file: sized_box_for_whitespace
import 'dart:typed_data';

import 'package:drawing_on_demand_web_admin/core/utils/validation_function.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileUserPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const ProfileUserPage({Key? key, this.id}) : super(key: key);
  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
  static void refresh() {
    state.refresh();
  }
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  late Future<Account?> account;
  String image = emptyImage;
  Uint8List? imageInBytes;
  @override
  void initState() {
    super.initState();
    ProfileUserPage.state = this;
    account = getData();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
            content: FutureBuilder(
                future: account,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String fullname = snapshot.data!.name!;
                    String address = snapshot.data!.address!;
                    String phone = snapshot.data!.phone!;
                    String bio = snapshot.data!.bio!;
                    if (snapshot.data!.avatar != null && snapshot.data!.avatar != "") {
                      image = snapshot.data!.avatar.toString();
                    }
                    final f = DateFormat('yyyy-MM-dd  hh:mm');
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(top: 18, left: 18),
                            height: 70,
                            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                            child: const Text('User Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Scrollbar(
                                      controller: controller,
                                      child: SingleChildScrollView(
                                        controller: controller,
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 1150,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            imageInBytes = await ImagePickerWeb.getImageAsBytes();
                                                            image = await uploadFile(imageInBytes!);
                                                            await updateAvatar(snapshot.data!.id.toString(), image);
                                                            ProfileUserPage.refresh();
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                height: 200,
                                                                width: 200,
                                                                child: imageInBytes == null
                                                                    ? CircleAvatar(
                                                                        backgroundImage: NetworkImage(image),
                                                                        backgroundColor: kWhite,
                                                                      )
                                                                    : Image.memory(imageInBytes!),
                                                              ),
                                                              const Icon(Icons.add_a_photo),
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                        width: 1150,
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
                                                        child: Form(
                                                            key: _formKey,
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Email: ${snapshot.data!.email}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                                  const SizedBox(height: 20),
                                                                  Text("Role: ${snapshot.data!.accountRoles!.first.role!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                                  const SizedBox(height: 20),
                                                                  Text("Status: ${snapshot.data!.status}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                                  const SizedBox(height: 20),
                                                                  Text("Created Date: ${f.format(snapshot.data!.createdDate!)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                                  const SizedBox(height: 20),
                                                                  Text("Gender: ${snapshot.data!.gender}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                                  const SizedBox(height: 20),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(hintText: fullname, hintStyle: const TextStyle(color: blackColor), border: const OutlineInputBorder(), labelText: 'Fullname', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                    controller: fullnameController,
                                                                    validator: (value) {
                                                                      if (value!.isNotEmpty) {
                                                                        if (!isFullname(value)) {
                                                                          return 'Please enter a valid fullname';
                                                                        }
                                                                        fullname = fullnameController.text;
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  const SizedBox(height: 20),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(hintText: address, hintStyle: const TextStyle(color: blackColor), border: const OutlineInputBorder(), labelText: 'Address', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                    controller: addressController,
                                                                    validator: (value) {
                                                                      if (value!.isNotEmpty) {
                                                                        if (!isAddress(value)) {
                                                                          return 'Please enter a address';
                                                                        }
                                                                        address = addressController.text;
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  const SizedBox(height: 20),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(hintText: phone, hintStyle: const TextStyle(color: blackColor), border: const OutlineInputBorder(), labelText: 'Phone', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                    controller: phoneController,
                                                                    validator: (value) {
                                                                      if (value!.isNotEmpty) {
                                                                        if (!isPhone(value)) {
                                                                          return 'Please enter a valid phone number';
                                                                        }
                                                                      }
                                                                      phone = phoneController.text;
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  const SizedBox(height: 20),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(hintText: bio, hintStyle: const TextStyle(color: blackColor), border: const OutlineInputBorder(), labelText: 'Bio', floatingLabelBehavior: FloatingLabelBehavior.always),
                                                                    controller: bioController,
                                                                    validator: (value) {
                                                                      if (value!.isNotEmpty) {
                                                                        bio = bioController.text;
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  const SizedBox(height: 20),
                                                                  Center(
                                                                    child: TextButton(
                                                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                                      child: const Text("Update Proflie", style: TextStyle(color: kWhite, fontSize: 20)),
                                                                      onPressed: () async {
                                                                        if (!_formKey.currentState!.validate()) {
                                                                          Fluttertoast.showToast(msg: 'Update failed');
                                                                        } else {
                                                                          await updateProfile(snapshot.data!.id.toString(), fullname, address, phone, bio);
                                                                        }
                                                                        clearTextFormField();
                                                                        ProfileUserPage.refresh();
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )))),
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

  Future<Account?> getData() async {
    try {
      return await AccountApi().getOne(widget.id!, 'accountRoles(expand=role)');
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get profile failed');
    }
    return null;
  }

  void refresh() {
    setState(() {
      account = getData();
    });
  }

  void clearTextFormField() {
    fullnameController.clear();
    addressController.clear();
    phoneController.clear();
    bioController.clear();
  }

  Future<void> updateProfile(String accountId, String fullname, String address, String phone, String bio) async {
    try {
      await AccountApi().patchOne(accountId, {'Name': fullname, 'Address': address, 'Phone': phone, 'Bio': bio});
    } catch (error) {
      Fluttertoast.showToast(msg: 'Update profile failed');
    }
  }

  Future<void> updateAvatar(String accountId, String image) async {
    try {
      await AccountApi().patchOne(accountId, {'Avatar': image});
    } catch (error) {
      Fluttertoast.showToast(msg: 'Update avatar failed');
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

      Reference ref = FirebaseStorage.instance.ref().child('images/' + Guid.newGuid.toString());

      final metadata = SettableMetadata(contentType: 'image/png');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(imageInBytes, metadata);

      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
    return imageUrl;
  }
}
