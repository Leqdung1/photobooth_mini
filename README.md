# photobooth_mini

Photobooth Mini foundation using Flutter Clean Architecture (Bloc/Cubit + GetIt + GoRouter).

## Architecture

- Composition root: `lib/app/bootstrap.dart`
- DI container: `lib/di/injection.dart`
- Feature module sample: `lib/features/photo_session/**`

Detailed rules: `docs/architecture.md`

## Run

```bash
flutter pub get
flutter run
flutter gen-l10n
```

## Verify

```bash
flutter analyze
flutter test
```
