import 'package:equatable/equatable.dart';

class PhotoSession extends Equatable {
  const PhotoSession({required this.id, required this.title, required this.shotCount});

  final String id;
  final String title;
  final int shotCount;

  @override
  List<Object?> get props => <Object?>[id, title, shotCount];
}
