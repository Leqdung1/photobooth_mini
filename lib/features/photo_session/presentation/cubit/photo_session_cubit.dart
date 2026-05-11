import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/use_case.dart';
import '../../domain/usecases/get_current_photo_session.dart';
import 'photo_session_state.dart';

class PhotoSessionCubit extends Cubit<PhotoSessionState> {
  PhotoSessionCubit(this._getCurrentPhotoSession) : super(const PhotoSessionState());

  final GetCurrentPhotoSession _getCurrentPhotoSession;

  Future<void> load() async {
    emit(state.copyWith(status: PhotoSessionStatus.loading, errorMessage: null));
    final result = await _getCurrentPhotoSession(const NoParams());
    result.match(
      (failure) => emit(
        state.copyWith(
          status: PhotoSessionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (session) => emit(
        state.copyWith(
          status: PhotoSessionStatus.success,
          session: session,
          errorMessage: null,
        ),
      ),
    );
  }
}
