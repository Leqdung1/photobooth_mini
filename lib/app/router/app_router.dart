import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/injection.dart';
import '../../features/photo_session/presentation/cubit/photo_session_cubit.dart';
import '../../features/photo_session/presentation/pages/photo_session_page.dart';

class AppRouter {
  AppRouter();

  late final GoRouter config = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (_, __) {
          return BlocProvider<PhotoSessionCubit>(
            create: (_) => sl<PhotoSessionCubit>(),
            child: const PhotoSessionPage(),
          );
        },
      ),
    ],
  );
}
