import 'package:drawing_on_demand_web_admin/app_routes/go_routes.dart';
import 'package:drawing_on_demand_web_admin/core/utils/pre_utils.dart';
import 'package:drawing_on_demand_web_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await PrefUtils().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());

  // RendererBinding.instance.ensureSemantics();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
// This widget is the root of your application.
  static void refreshRoutes(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    if (state != null) {
      state.setRoutes();
    }
  }
}

class _MyAppState extends State<MyApp> {
  GlobalKey key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: key,
      debugShowCheckedModeBanner: false,
      title: 'Drawing on Demand Management',
      theme: ThemeData(primaryColor: kPrimaryColor),
      routerConfig: AppRoutes.routes(),
    );
  }

  void setRoutes() {
    setState(() {
      key = GlobalKey();
    });
  }
}
