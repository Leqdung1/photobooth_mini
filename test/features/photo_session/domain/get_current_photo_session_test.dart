import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photobooth_mini/core/errors/failures.dart';
import 'package:photobooth_mini/core/usecases/use_case.dart';
import 'package:photobooth_mini/features/photo_session/domain/entities/photo_session.dart';
import 'package:photobooth_mini/features/photo_session/domain/repositories/photo_session_repository.dart';
import 'package:photobooth_mini/features/photo_session/domain/usecases/get_current_photo_session.dart';

class _MockPhotoSessionRepository extends Mock
    implements PhotoSessionRepository {}

void main() {
  late _MockPhotoSessionRepository repository;
  late GetCurrentPhotoSession useCase;

  setUp(() {
    repository = _MockPhotoSessionRepository();
    useCase = GetCurrentPhotoSession(repository);
  });

  test('returns session on success', () async {
    const session = PhotoSession(
      id: 'session-001',
      title: 'Mini Booth Session',
      shotCount: 4,
    );
    when(() => repository.getCurrentSession())
        .thenAnswer((_) async => const Right<Failure, PhotoSession>(session));

    final result = await useCase(const NoParams());

    expect(result, const Right<Failure, PhotoSession>(session));
  });

  test('returns failure on error', () async {
    when(() => repository.getCurrentSession()).thenAnswer(
      (_) async => const Left<Failure, PhotoSession>(
        UnexpectedFailure('Unable to load photo session.'),
      ),
    );

    final result = await useCase(const NoParams());

    expect(
      result,
      const Left<Failure, PhotoSession>(
        UnexpectedFailure('Unable to load photo session.'),
      ),
    );
  });
}
