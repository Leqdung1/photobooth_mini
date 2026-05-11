// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Photobooth Mini';

  @override
  String get photoSessionTitle => 'Photo Session';

  @override
  String get unexpectedError => 'Unexpected error';

  @override
  String sessionIdLabel(Object id) {
    return 'Session ID: $id';
  }

  @override
  String shotsPlannedLabel(Object count) {
    return 'Shots planned: $count';
  }

  @override
  String get loadingSession => 'Loading session...';

  @override
  String get switchToVietnamese => 'Tiếng Việt';

  @override
  String get switchToEnglish => 'English';
}
