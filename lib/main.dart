import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawing on Demand Management',
      theme: ThemeData(primaryColor: kPrimaryColor),
      initialRoute: AppRoute.login,
      routes: AppRoute.routes,
    );
  }
}
