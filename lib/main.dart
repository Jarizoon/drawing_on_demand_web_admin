import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/core/utils/pre_utils.dart';
import 'package:drawing_on_demand_web_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());

  // RendererBinding.instance.ensureSemantics();
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
