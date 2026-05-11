import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/photo_session.dart';
import '../repositories/photo_session_repository.dart';

class GetCurrentPhotoSession implements UseCase<PhotoSession, NoParams> {
  const GetCurrentPhotoSession(this._repository);

  final PhotoSessionRepository _repository;

  @override
  Future<Either<Failure, PhotoSession>> call(NoParams params) {
    return _repository.getCurrentSession();
  }
}
