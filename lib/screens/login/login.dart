// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/account_api.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: kWhite,
                        ),
                        child: TextFormField(
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: kNeutralColor,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            prefixIcon: IconButton(onPressed: () {}, icon: Image.asset(emailIcon)),
                            hintText: 'Enter Email',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kNeutralColor.withOpacity(0.3),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
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
                      const SizedBox(height: 5.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: kWhite,
                        ),
                        child: TextFormField(
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: kNeutralColor,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            prefixIcon: IconButton(onPressed: () {}, icon: Image.asset(lockIcon)),
                            hintText: 'Enter Password',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kNeutralColor.withOpacity(0.3),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => openAlertDialogSendOTP(context),
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
                  ),

                  Container(
                    height: height * 0.1,
                    width: width * 0.25,
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => login(context),
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

  login(BuildContext context) async {
    var account = await AccountApi().gets(0, expand: 'accountRoles(expand=role)');
    // try{

    // }catch(e){
    //   Fluttertoast.showToast(msg: 'Invalid email or password');
    // }
    Fluttertoast.showToast(msg: account.value.first.accountRoles!.last.role!.name.toString());
  }

  AlertDialog openAlertDialogSendOTP(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => openAlertDialogInputOTP(context),
            );
          },
          child: const Text('Submit'),
        ),
      ],
      title: const Text('Enter your email and we will send you OTP!!'),
      contentPadding: const EdgeInsets.all(20.0),
      content: const TextField(
        decoration: InputDecoration(
          hintText: 'Enter email',
        ),
      ),
    );
  }

  AlertDialog openAlertDialogInputOTP(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Submit'),
        ),
      ],
      title: const Text('Please input OTP!!'),
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
