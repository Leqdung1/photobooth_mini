import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/photo_session.dart';
import '../../domain/repositories/photo_session_repository.dart';
import '../datasources/photo_session_local_datasource.dart';

class PhotoSessionRepositoryImpl implements PhotoSessionRepository {
  const PhotoSessionRepositoryImpl(this._localDataSource);

  final PhotoSessionLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, PhotoSession>> getCurrentSession() async {
    try {
      final model = await _localDataSource.getCurrentSession();
      return Right<Failure, PhotoSession>(model.toEntity());
    } catch (_) {
      return const Left<Failure, PhotoSession>(
        UnexpectedFailure('Unable to load photo session.'),
      );
    }
  }
}
