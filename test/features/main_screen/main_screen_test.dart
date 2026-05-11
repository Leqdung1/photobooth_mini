import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photobooth_mini/di/injection.dart';
import 'package:photobooth_mini/features/main_screen/presentation/pages/custom_tab_page.dart';
import 'package:photobooth_mini/features/history/history_screen.dart';
import 'package:photobooth_mini/features/main_screen/presentation/pages/main_screen.dart';
import 'package:photobooth_mini/features/setting/setting_screen.dart';

void main() {
  setUp(() async {
    await sl.reset();
    await configureDependencies();
  });

  testWidgets('renders four bottom navigation items', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('tab-home')), findsOneWidget);
    expect(find.byKey(const Key('tab-custom')), findsOneWidget);
    expect(find.byKey(const Key('tab-history')), findsOneWidget);
    expect(find.byKey(const Key('tab-setting')), findsOneWidget);
  });

  testWidgets('switches visible tab body when tapping items', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('tab-custom')));
    await tester.pumpAndSettle();
    expect(find.byKey(CustomTabPage.bodyKey), findsOneWidget);

    await tester.tap(find.byKey(const Key('tab-history')));
    await tester.pumpAndSettle();
    expect(find.byKey(HistoryTabPage.bodyKey), findsOneWidget);

    await tester.tap(find.byKey(const Key('tab-setting')));
    await tester.pumpAndSettle();
    expect(find.byKey(SettingTabPage.bodyKey), findsOneWidget);
  });
}
