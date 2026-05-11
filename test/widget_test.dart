// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

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

  testWidgets('App renders root shell', (WidgetTester tester) async {
    await tester.pumpWidget(
      App(
        router: AppRouter(),
        localeController: LocaleController(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('tab-home')), findsOneWidget);
    expect(find.byKey(const Key('tab-custom')), findsOneWidget);
    expect(find.byKey(const Key('tab-history')), findsOneWidget);
    expect(find.byKey(const Key('tab-setting')), findsOneWidget);
  });
}
