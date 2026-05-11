import 'package:equatable/equatable.dart';

import '../../domain/entities/photo_session.dart';

enum PhotoSessionStatus { initial, loading, success, failure }

class PhotoSessionState extends Equatable {
  const PhotoSessionState({
    this.status = PhotoSessionStatus.initial,
    this.session,
    this.errorMessage,
  });

  final PhotoSessionStatus status;
  final PhotoSession? session;
  final String? errorMessage;

  PhotoSessionState copyWith({
    PhotoSessionStatus? status,
    PhotoSession? session,
    String? errorMessage,
  }) {
    return PhotoSessionState(
      status: status ?? this.status,
      session: session ?? this.session,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, session, errorMessage];
}
