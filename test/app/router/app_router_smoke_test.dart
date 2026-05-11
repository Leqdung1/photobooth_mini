import 'package:flutter_test/flutter_test.dart';
import 'package:photobooth_mini/app/app.dart';
import 'package:photobooth_mini/app/locale/locale_controller.dart';
import 'package:photobooth_mini/app/router/app_router.dart';
import 'package:photobooth_mini/di/injection.dart';

void main() {
  setUp(() async {
    await sl.reset();
    await configureDependencies();
  });

  testWidgets('router root loads main screen shell', (WidgetTester tester) async {
    await tester.pumpWidget(
      App(
        router: AppRouter(),
        localeController: LocaleController(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Custom'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Setting'), findsOneWidget);
  });
}
