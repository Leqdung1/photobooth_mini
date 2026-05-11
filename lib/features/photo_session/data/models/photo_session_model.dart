import '../../domain/entities/photo_session.dart';

class PhotoSessionModel {
  const PhotoSessionModel({required this.id, required this.title, required this.shotCount});

  final String id;
  final String title;
  final int shotCount;

  PhotoSession toEntity() {
    return PhotoSession(id: id, title: title, shotCount: shotCount);
  }
}
