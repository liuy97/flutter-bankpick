enum AuthState {
  unknown(
    redirectPath: '/',
    allowedPaths: [
      '/',
    ],
  ),
  unauthenticated(
    redirectPath: '/login',
    allowedPaths: [
      '/login',
      '/signup',
      '/onboarding',
    ],
  ),
  authenticated(
    redirectPath: '/home',
    allowedPaths: [
      '/home',
      '/home/search',
      '/home/send-money',
      '/home/request-money',
      '/home/loan-money',
      '/home/top-up',
      '/my-cards',
      '/my-cards/all-cards',
      '/my-cards/all-cards/add',
      '/statistic',
      '/statistic/:id',
      '/profile',
      '/profile/language',
      '/profile/myProfile',
      '/profile/myProfile/editProfile',
      '/profile/contactUs',
      '/profile/changePassword',
      '/profile/privacyPolicy',
      '/settings',
    ],
  ),
  ;

  const AuthState({
    required this.redirectPath,
    required this.allowedPaths,
  });

  final String redirectPath;

  final List<String> allowedPaths;
}
