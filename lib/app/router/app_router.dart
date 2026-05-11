import 'package:go_router/go_router.dart';

import '../../features/main_screen/presentation/pages/main_screen.dart';

class AppRouter {
  AppRouter();

  late final GoRouter config = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (_, __) => const MainScreen(),
      ),
    ],
  );
}
