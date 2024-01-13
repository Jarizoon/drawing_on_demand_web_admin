class LoginRoute {
  static const String tag = '/login';
  static const String name = 'Login';
}

class DashboardRoute {
  static const String tag = '/dashboard';
  static const String name = 'Dashboard';
}

class AccountRoute {
  static const String tag = '/account';
  static const String name = 'Account';
}

class AccountDetailRoute {
  static const String tag = ':account_id';
  static const String name = 'Account Detail';
}

class ArtistRoute {
  static const String tag = '/artist';
  static const String name = 'Artist';
}

class CustomerRoute {
  static const String tag = '/customer';
  static const String name = 'Customer';
}

class CreateStaffRoute {
  static const String tag = '/create_staff';
  static const String name = 'Create Staff';
}

class ProfileUserRouter {
  static const String tag = '/profile/:user_id';
  static const String name = 'Profile User';
}

class ArtistRegisterRoute {
  static const String tag = '/artistRegister';
  static const String name = 'Artist Register';
}

class ArtistRegisterDetailRoute {
  static const String tag = ':artistRegister_id';
  static const String name = 'Artist Register Detail';
}

class ArtworkRoute {
  static const String tag = '/artwork';
  static const String name = 'Artwork';
}

class ArtworkDetailRoute {
  static const String tag = ':artwork_id';
  static const String name = 'Artwork Detail';
}

class OrderRoute {
  static const String tag = '/order';
  static const String name = 'Order';
}

class OrderDetailRoute {
  static const String tag = ':order_id';
  static const String name = 'Order Detail';
}

class RequirementRoute {
  static const String tag = '/requirement';
  static const String name = 'Requirement';
}

class RequirementDetailRoute {
  static const String tag = ':requirement_id';
  static const String name = 'Requirement Detail';
}
