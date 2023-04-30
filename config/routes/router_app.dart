import 'package:go_router/go_router.dart';

final routerApp = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LaunchPage.route,
      builder: (context, state) => const LaunchPage(),
    ),
  ],
);
