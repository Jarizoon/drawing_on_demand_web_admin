// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: thirdColor,
      child: ListView(children: [
        const DrawerHeader(
          child: Image(
            image: AssetImage(smallLogoIcon),
          ),
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.dashboard, (route) => false);
          },
          title: 'Dashboard',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.order, (route) => false);
          },
          title: 'Order',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.customer, (route) => false);
          },
          title: 'Customer',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.requirement, (route) => false);
          },
          title: 'Requirement',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.artist, (route) => false);
          },
          title: 'Artist',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.artwork, (route) => false);
          },
          title: 'Artwork',
        ),
        const Divider(
          color: Colors.white70,
        ),
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.artistRegister, (route) => false);
          },
          title: 'Artist Register',
        ),
        const Divider(
          color: Colors.white70,
        ),
        Visibility(
          visible: true,
          child: DrawerListTile(
            press: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.account, (route) => false);
            },
            title: 'Account',
          ),
        ),
      ]),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(180, 255, 255, 255),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
