import 'package:drawing_on_demand_web_admin/core/utils/pre_utils.dart';

class ApiConfig {
  static const String baseUrl = 'dond.azurewebsites.net';
  static const String paymentUri = 'http://localhost:8000';

  static Map<String, String> get headers {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${PrefUtils().getToken()}',
    };
  }

  static const String odata = 'Odata';

  static const Map<String, String> paths = {
    'accountReview': 'accountReviews',
    'accountRole': 'accountRoles',
    'account': 'accounts',
    'art': 'arts',
    'artworkReview': 'artworkReviews',
    'artwork': 'artworks',
    'category': 'categories',
    'certificate': 'certificates',
    'discount': 'discounts',
    'handoverItem': 'handoverItems',
    'handover': 'handovers',
    'invite': 'invites',
    'material': 'materials',
    'orderDetail': 'orderDetails',
    'order': 'orders',
    'payment': 'payments',
    'proposal': 'proposals',
    'rank': 'ranks',
    'requirement': 'requirements',
    'role': 'roles',
    'size': 'sizes',
    'step': 'steps',
    'surface': 'surfaces',
  };
}
