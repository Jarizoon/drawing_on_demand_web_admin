// ignore_for_file: sized_box_for_whitespace
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
              visible: MediaQuery.of(context).size.width >= 1100,
              child: const SizedBox(width: 30)),
          Visibility(
            visible: MediaQuery.of(context).size.width >= 850,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text('Drawing On Demand',
                    style: kTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: kWhite,
                        fontSize: 24)),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(18.0))),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: const Center(
                    child: Image(image: AssetImage(profileIcon)),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Admin',
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.w400, color: kWhite)),
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
                      items: const [
                        DropdownMenuItem(
                            value: 'Change Password',
                            child: Text('Change Password')),
                        DropdownMenuItem(
                            value: 'Log Out', child: Text('Log Out'))
                      ],
                      onChanged: (value) {
                        switch (value) {
                          case 'Change Password':
                            break;
                          case 'Log Out':
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
