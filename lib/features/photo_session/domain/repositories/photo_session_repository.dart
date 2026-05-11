import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/photo_session.dart';

abstract class PhotoSessionRepository {
  Future<Either<Failure, PhotoSession>> getCurrentSession();
}
