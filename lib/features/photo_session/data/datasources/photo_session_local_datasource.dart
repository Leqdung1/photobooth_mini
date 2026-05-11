import '../models/photo_session_model.dart';

abstract class PhotoSessionLocalDataSource {
  Future<PhotoSessionModel> getCurrentSession();
}

class PhotoSessionLocalDataSourceImpl implements PhotoSessionLocalDataSource {
  @override
  Future<PhotoSessionModel> getCurrentSession() async {
    return const PhotoSessionModel(
      id: 'session-001',
      title: 'Mini Booth Session',
      shotCount: 4,
    );
  }
}
