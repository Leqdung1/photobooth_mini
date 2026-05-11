import 'package:get_it/get_it.dart';

import '../app/router/app_router.dart';
import '../app/locale/locale_controller.dart';
import '../features/photo_session/data/datasources/photo_session_local_datasource.dart';
import '../features/photo_session/data/repositories/photo_session_repository_impl.dart';
import '../features/photo_session/domain/repositories/photo_session_repository.dart';
import '../features/photo_session/domain/usecases/get_current_photo_session.dart';
import '../features/photo_session/presentation/cubit/photo_session_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl
    ..registerLazySingleton<PhotoSessionLocalDataSource>(
      PhotoSessionLocalDataSourceImpl.new,
    )
    ..registerLazySingleton<PhotoSessionRepository>(
      () => PhotoSessionRepositoryImpl(sl<PhotoSessionLocalDataSource>()),
    )
    ..registerLazySingleton<GetCurrentPhotoSession>(
      () => GetCurrentPhotoSession(sl<PhotoSessionRepository>()),
    )
    ..registerFactory<PhotoSessionCubit>(
      () => PhotoSessionCubit(sl<GetCurrentPhotoSession>()),
    )
    ..registerLazySingleton<LocaleController>(LocaleController.new)
    ..registerLazySingleton<AppRouter>(AppRouter.new);
}
