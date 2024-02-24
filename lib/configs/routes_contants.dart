abstract class AppRoutes {
  // Splash screen
  static const _splashScopeName = 'splash';
  static const rootSplash = AppRouteData('splash', _splashScopeName, true);

  // Get Started
  static const _getStartedScopeName = 'getStarted';
  static const rootGetStartedRoute =
      AppRouteData('getStarted', _getStartedScopeName, true);

  // Login in
  static const _loginScopeName = 'login';
  static const login = AppRouteData('/initialLogin', _loginScopeName);
  static const loginSignup = AppRouteData('loginSignup', _loginScopeName);
  static const signupVerifyOtp =
      AppRouteData('signupVerifyOtp/:email', _loginScopeName);

  // Home
  static const _homeScopeName = 'home';
  static const rootHome = AppRouteData('home', _homeScopeName, true);
  static const homeProductDetails = AppRouteData('homeProductDetails', _homeScopeName);
  static const homeProductCart = AppRouteData('homeProductCart', _homeScopeName);

  // Users
  static const _usersScopeName = 'users';
  static const users = AppRouteData('users', _usersScopeName);

  // User Detail
  static const _userDetailScopeName = 'userDetail';
  static const userDetail = AppRouteData('userDetail', _userDetailScopeName);
}

class AppRouteData {
  final String name;
  final bool isRoot;
  final String scopeName;

  String get path => isRoot ? '/$name' : name;

  const AppRouteData(this.name, this.scopeName, [this.isRoot = false]);
}
