import 'package:go_router/go_router.dart';

import 'package:todo_app/app/navigation/route_names.dart';
import 'package:todo_app/app/views/widgets/bottom_navigation_bar.dart';
import 'package:todo_app/features/auth/presentation/view/login_view.dart';
import 'package:todo_app/features/auth/presentation/view/register_view.dart';
import 'package:todo_app/features/auth/presentation/view/user_details.dart';
import 'package:todo_app/introduction.dart';
import 'package:todo_app/splash.dart';
import 'package:todo_app/features/user/view/app_settings_view.dart';

class Routes {
  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: RouteNames.splash,
        path: '/',
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding',
        builder: (context, state) => const OnBoarding()),
    GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder: (context, state) => const LoginView()),
    GoRoute(
        name: RouteNames.register,
        path: '/register',
        builder: (context, state) => const RegisterView()),
    GoRoute(
        name: RouteNames.naviation,
        path: '/navigation',
        builder: (context, state) => MyBottomNavigationBar()),
    GoRoute(
      name: RouteNames.userDetails,
      path: '/user_details',
      builder: (context, state) => const UserDetailsView(),
    ),
    GoRoute(
      name: RouteNames.appSettings,
      path: "/app_settings",
      builder: (context, state) => const AppSettingsView(),
    )
  ]);
}
