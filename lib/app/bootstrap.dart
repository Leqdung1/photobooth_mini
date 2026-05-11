import 'package:flutter/material.dart';
import 'package:photobooth_mini/app/locale/locale_controller.dart';

import '../di/injection.dart';
import 'app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    App(
      router: sl(),
      localeController: sl<LocaleController>(),
    ),
  );
}
