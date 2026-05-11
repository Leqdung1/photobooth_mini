import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photobooth_mini/core/errors/failures.dart';
import 'package:photobooth_mini/core/usecases/use_case.dart';
import 'package:photobooth_mini/features/photo_session/domain/entities/photo_session.dart';
import 'package:photobooth_mini/features/photo_session/domain/usecases/get_current_photo_session.dart';
import 'package:photobooth_mini/features/photo_session/presentation/cubit/photo_session_cubit.dart';
import 'package:photobooth_mini/features/photo_session/presentation/cubit/photo_session_state.dart';

class _MockGetCurrentPhotoSession extends Mock implements GetCurrentPhotoSession {}

void main() {
  late _MockGetCurrentPhotoSession useCase;

  setUp(() {
    useCase = _MockGetCurrentPhotoSession();
  });

  blocTest<PhotoSessionCubit, PhotoSessionState>(
    'emits loading then success when use case resolves',
    build: () {
      when(() => useCase(const NoParams())).thenAnswer(
        (_) async => const Right<Failure, PhotoSession>(
          PhotoSession(id: 'session-001', title: 'Mini Booth Session', shotCount: 4),
        ),
      );
      return PhotoSessionCubit(useCase);
    },
    act: (PhotoSessionCubit cubit) => cubit.load(),
    expect: () => <PhotoSessionState>[
      const PhotoSessionState(status: PhotoSessionStatus.loading),
      const PhotoSessionState(
        status: PhotoSessionStatus.success,
        session: PhotoSession(id: 'session-001', title: 'Mini Booth Session', shotCount: 4),
      ),
    ],
  );

  blocTest<PhotoSessionCubit, PhotoSessionState>(
    'emits loading then failure when use case fails',
    build: () {
      when(() => useCase(const NoParams())).thenAnswer(
        (_) async => const Left<Failure, PhotoSession>(
          UnexpectedFailure('Unable to load photo session.'),
        ),
      );
      return PhotoSessionCubit(useCase);
    },
    act: (PhotoSessionCubit cubit) => cubit.load(),
    expect: () => <PhotoSessionState>[
      const PhotoSessionState(status: PhotoSessionStatus.loading),
      const PhotoSessionState(
        status: PhotoSessionStatus.failure,
        errorMessage: 'Unable to load photo session.',
      ),
    ],
  );
}
