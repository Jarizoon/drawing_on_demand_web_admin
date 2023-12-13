import 'package:drawing_on_demand_web_admin/screens/account/account.dart';
import 'package:drawing_on_demand_web_admin/screens/artist/artist.dart';
import 'package:drawing_on_demand_web_admin/screens/artist_register/artist_register.dart';
import 'package:drawing_on_demand_web_admin/screens/artist_register/artist_register_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/artwork/artwork.dart';
import 'package:drawing_on_demand_web_admin/screens/customer/customer.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/dashboard.dart';
import 'package:drawing_on_demand_web_admin/screens/login/login.dart';
import 'package:drawing_on_demand_web_admin/screens/order/order.dart';
import 'package:drawing_on_demand_web_admin/screens/order/order_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/requirement/requirement.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String order = '/order';
  static const String orderDetail = '/order_detai;';
  static const String customer = '/customer';
  static const String requirement = '/requirement';
  static const String artist = '/artist';
  static const String artwork = '/artwork';
  static const String artistRegister = '/artist_register';
  static const String artistRegisterDetail = '/artist_register_detail';
  static const String account = '/account';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const Login(),
    dashboard: (context) => const Dashboard(),
    order: (context) => const Order(),
    orderDetail: (context) => const OrderDetail(),
    customer: (context) => const Customer(),
    requirement: (context) => const Requirement(),
    artist: (context) => const Artist(),
    artwork: (context) => const Artwork(),
    artistRegister: (context) => const ArtistRegister(),
    artistRegisterDetail: (context) => const ArtistRegisterDetail(),
    account: (context) => const Account(),
  };
}
