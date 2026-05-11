import 'package:flutter/material.dart';

import '../di/injection.dart';
import 'app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(App(router: sl()));
}
