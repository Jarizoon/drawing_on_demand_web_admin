import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/core/utils/pre_utils.dart';
import 'package:drawing_on_demand_web_admin/screens/account/account.dart';
import 'package:drawing_on_demand_web_admin/screens/account/account_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/account/artist.dart';
import 'package:drawing_on_demand_web_admin/screens/account/create_staff.dart';
import 'package:drawing_on_demand_web_admin/screens/account/customer.dart';
import 'package:drawing_on_demand_web_admin/screens/account/profile_user.dart';
import 'package:drawing_on_demand_web_admin/screens/artist_register/artist_register.dart';
import 'package:drawing_on_demand_web_admin/screens/artist_register/artist_register_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/artwork/artwork.dart';
import 'package:drawing_on_demand_web_admin/screens/artwork/artwork_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/dashboard/dashboard.dart';
import 'package:drawing_on_demand_web_admin/screens/login/login.dart';
import 'package:drawing_on_demand_web_admin/screens/management/management.dart';
import 'package:drawing_on_demand_web_admin/screens/order/order.dart';
import 'package:drawing_on_demand_web_admin/screens/order/order_detail.dart';
import 'package:drawing_on_demand_web_admin/screens/requirement/requirement.dart';
import 'package:drawing_on_demand_web_admin/screens/requirement/requirement_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

get rootNavigatorState => _rootNavigatorKey.currentState;
get shellNavigatorState => _shellNavigatorKey.currentState;

class AppRoutes {
  static GoRouter routes() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: LoginRoute.tag,
      routes: [
        GoRoute(
            path: LoginRoute.tag,
            name: LoginRoute.name,
            builder: (context, state) {
              return const LoginPage();
            }),
        GoRoute(
          path: DashboardRoute.tag,
          name: DashboardRoute.name,
          builder: (context, state) {
            return const DashboardPage();
          },
          redirect: (context, state) => _unAuthened(),
        ),
        if (PrefUtils().getRole() == 'Admin')
        GoRoute(
            path: AccountRoute.tag,
            name: AccountRoute.name,
            builder: (context, state) {
              return const AccountPage();
            },
            redirect: (context, state) => _unAuthened(),
            routes: [
              GoRoute(
                path: CreateStaffRoute.tag,
                name: CreateStaffRoute.name,
                builder: (context, state) {
                  return const CreateStaffPage();
                },
              ),
            ]),
        GoRoute(
          path: AccountDetailRoute.tag,
          name: AccountDetailRoute.name,
          builder: (context, state) {
            return AccountDetailPage(id: state.pathParameters['account_id']);
          },
          redirect: (context, state) => _unAuthened(),
        ),
        GoRoute(
          path: ProfileUserRouter.tag,
          name: ProfileUserRouter.name,
          builder: (context, state) {
            return ProfileUserPage(id: state.pathParameters['user_id']);
          },
          redirect: (context, state) => _unAuthened(),
        ),
        GoRoute(
          path: ArtistRoute.tag,
          name: ArtistRoute.name,
          builder: (context, state) {
            return const ArtistPage();
          },
          redirect: (context, state) => _unAuthened(),
        ),
        GoRoute(
          path: CustomerRoute.tag,
          name: CustomerRoute.name,
          builder: (context, state) {
            return const CustomerPage();
          },
          redirect: (context, state) => _unAuthened(),
        ),
        if (PrefUtils().getRole() == 'Admin')
        GoRoute(
            path: ArtistRegisterRoute.tag,
            name: ArtistRegisterRoute.name,
            builder: (context, state) {
              return const ArtistRegisterPage();
            },
            redirect: (context, state) => _unAuthened(),
            routes: [
              GoRoute(
                  path: ArtistRegisterDetailRoute.tag,
                  name: ArtistRegisterDetailRoute.name,
                  builder: (context, state) {
                    return ArtistRegisterDetailPage(id: state.pathParameters['artistRegister_id']);
                  }),
            ]),
        GoRoute(
            path: ArtworkRoute.tag,
            name: ArtworkRoute.name,
            builder: (context, state) {
              return const ArtworkPage();
            },
            redirect: (context, state) => _unAuthened(),
            routes: [
              GoRoute(
                  path: ArtworkDetailRoute.tag,
                  name: ArtworkDetailRoute.name,
                  builder: (context, state) {
                    return ArtworkDetailPage(id: state.pathParameters['artwork_id']);
                  }),
            ]),
        GoRoute(
            path: OrderRoute.tag,
            name: OrderRoute.name,
            builder: (context, state) {
              return const OrderPage();
            },
            redirect: (context, state) => _unAuthened(),
            routes: [
              GoRoute(
                  path: OrderDetailRoute.tag,
                  name: OrderDetailRoute.name,
                  builder: (context, state) {
                    return OrderDetailPage(id: state.pathParameters['order_id']);
                  })
            ]),
        GoRoute(
            path: RequirementRoute.tag,
            name: RequirementRoute.name,
            builder: (context, state) {
              return const RequirementPage();
            },
            redirect: (context, state) => _unAuthened(),
            routes: [
              GoRoute(
                  path: RequirementDetailRoute.tag,
                  name: RequirementDetailRoute.name,
                  builder: (context, state) {
                    return RequirementDetailPage(id: state.pathParameters['requirement_id']);
                  })
            ]),
        if (PrefUtils().getRole() == 'Admin')
          GoRoute(
            path: ManagementRoute.tag,
            name: ManagementRoute.name,
            builder: (context, state) {
              return const ManagementPage();
            },
            redirect: (context, state) => _unAuthened(),
          ),
      ],
      onException: (context, state, router) {
        router.go(LoginRoute.tag);
      },
    );
  }

  static String? _unAuthened() {
    return PrefUtils().getToken() != '{}' ? null : LoginRoute.tag;
  }
}
