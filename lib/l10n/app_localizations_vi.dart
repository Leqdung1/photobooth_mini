// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Photobooth Mini';

  @override
  String get photoSessionTitle => 'Phiên chụp ảnh';

  @override
  String get unexpectedError => 'Đã xảy ra lỗi không mong muốn';

  @override
  String sessionIdLabel(Object id) {
    return 'Mã phiên: $id';
  }

  @override
  String shotsPlannedLabel(Object count) {
    return 'Số ảnh dự kiến: $count';
  }

  @override
  String get loadingSession => 'Đang tải phiên chụp...';

  @override
  String get switchToVietnamese => 'Tiếng Việt';

  @override
  String get switchToEnglish => 'English';
}
