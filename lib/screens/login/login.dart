// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/core/utils/pre_utils.dart';
import 'package:drawing_on_demand_web_admin/core/utils/progress_diaglog_utils.dart';
import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kWhite,
      body: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: height,
                color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.3,
                      child: Center(
                          child: Visibility(
                        visible: MediaQuery.of(context).size.width >= 850,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 44.0,
                              color: kWhite,
                              fontFamily: 'ubuntu-bold',
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Welcome to DonD Management",
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: height * 0.6,
                      child: const Center(
                        child: Image(image: AssetImage(logoIcon)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: height * 0.1,
            ),
            Expanded(
                child: Container(
              height: height,
              color: kWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.3,
                    width: width * 0.2,
                    child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Please',
                            style: ralewayStyle.copyWith(
                              fontSize: 32.0,
                              color: kNeutralColor,
                              fontWeight: FontWeight.normal,
                            )),
                        TextSpan(
                            text: ' Sign In 👇',
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              color: kNeutralColor,
                              fontSize: 32.0,
                            )),
                      ])),
                    ),
                  ),
                  Container(
                      height: height * 0.4,
                      width: width * 0.4,
                      child: Form(
                        key: _formKey,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                          Text(
                            'Email',
                            style: ralewayStyle.copyWith(
                              fontSize: 18.0,
                              color: kNeutralColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          TextFormField(
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kNeutralColor,
                              fontSize: 18.0,
                            ),
                            showCursor: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(top: 16.0),
                                prefixIcon: const Icon(Icons.email_outlined, color: black),
                                hintText: 'Enter Email',
                                hintStyle: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: kNeutralColor.withOpacity(0.3),
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: black, width: 1), borderRadius: BorderRadius.circular(10))),
                            controller: emailController,
                            validator: (value) {
                              if (!isEmail(value!)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            autofillHints: const [AutofillHints.username],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Password',
                            style: ralewayStyle.copyWith(
                              fontSize: 18.0,
                              color: kNeutralColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextFormField(
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kNeutralColor,
                              fontSize: 18.0,
                            ),
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(top: 16.0),
                              prefixIcon: const Icon(Icons.lock, color: black),
                              hintText: 'Enter Password',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: kNeutralColor.withOpacity(0.3),
                                fontSize: 18.0,
                              ),
                              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: black, width: 1), borderRadius: BorderRadius.circular(10)),
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
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            autofillHints: const [AutofillHints.password],
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => openAlertDialogSendOTP(),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: kTextStyle.copyWith(color: kLightNeutralColor),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ]),
                      )),
                  Container(
                    height: height * 0.1,
                    width: width * 0.25,
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => login(),
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.022, vertical: width * 0.015),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: kPrimaryColor,
                            ),
                            child: Text(
                              'Login',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: kWhite,
                                fontSize: width * 0.015,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      ProgressDialogUtils.showProgress(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      var accounts = await AccountApi().gets(0, filter: "email eq '${emailController.text.trim()}'", expand: 'accountRoles(expand=role)');
      var account = accounts.value.first;
      if (accounts.value.isNotEmpty && account.accountRoles!.where((ar) => ar.role!.name == "Admin" || ar.role!.name == "Staff" && ar.status == "Active").isNotEmpty) {
        await PrefUtils().setAccount(account);
        if (account.accountRoles!.first.role!.name == "Admin") {
          await PrefUtils().setRole('Admin');
        } else {
          await PrefUtils().setRole('Staff');
        }
        // Save token
        var token = await FirebaseAuth.instance.currentUser!.getIdToken();

        await PrefUtils().setToken(token!);

        // Navigator
        ProgressDialogUtils.hideProgress(context);
        context.goNamed(DashboardRoute.name);
      } else {
        ProgressDialogUtils.hideProgress(context);
        Fluttertoast.showToast(msg: 'Invalid email or password');
      }
    } catch (e) {
      ProgressDialogUtils.hideProgress(context);
      Fluttertoast.showToast(msg: 'Invalid email or password');
    }
  }

  AlertDialog openAlertDialogSendOTP() {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailForgotPasswordController = TextEditingController();
    return AlertDialog(
        actions: [
          TextButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) {
                return;
              } else {
                var accounts = await AccountApi().gets(0, filter: "email eq '${emailForgotPasswordController.text.trim()}'");
                if (accounts.value.isNotEmpty) {
                  myauth.setConfig(
                            appEmail: "dond@gmail.com",
                            appName: "Email OTP",
                            userEmail: emailController.text,
                            otpLength: 4,
                            otpType: OTPType.digitsOnly
                          );
                  bool isSend = await myauth.sendOTP();
                  if ( isSend == true) {
                    Fluttertoast.showToast(msg: 'OTP was sent');
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) => openAlertDialogInputOTP(),
                    );
                  }else {
                    Fluttertoast.showToast(msg: 'Send OTP failed');
                  }
                }else{
                  Fluttertoast.showToast(msg: 'Incorrect Email');
                }
              }
            },
            child: const Text('Submit'),
          ),
        ],
        title: Container(
          padding: const EdgeInsets.all(5),
          height: 40,
          color: kPrimaryColor,
          child: const Center(
            child: Text('Enter your email to get OTP!!'),
          ),
        ),
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(20.0),
        content: Form(
          key: formKey,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter email',
            ),
            controller: emailForgotPasswordController,
            validator: (value) {
              if (!isEmail(value!)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ));
  }

  AlertDialog openAlertDialogInputOTP() {
    TextEditingController otp1Controller = TextEditingController();
    TextEditingController otp2Controller = TextEditingController();
    TextEditingController otp3Controller = TextEditingController();
    TextEditingController otp4Controller = TextEditingController();
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () async {
            if (await myauth.verifyOTP(otp: otp1Controller.text + otp2Controller.text + otp3Controller.text + otp4Controller.text) == true) {
              Navigator.of(context).pop();
            } else {
              Fluttertoast.showToast(msg: 'Invalid OTP');
            }
          },
          child: const Text('Submit'),
        ),
      ],
      title: Container(
        height: 40,
        color: kPrimaryColor,
        child: const Center(
          child: Text('Please input OTP!!'),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: otp1Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: otp2Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: otp3Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: otp4Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      )),
    );
  }
}
