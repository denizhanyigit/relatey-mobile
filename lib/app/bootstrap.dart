import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/storage/db.dart';

/// Global database instance initialized during bootstrap.
late final AppDatabase appDatabase;

/// Bootstrap function to initialize app dependencies.
Future<void> bootstrap() async {
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  
  // Initialize database
  appDatabase = AppDatabase();
  
  if (kDebugMode) {
    // ignore: avoid_print
    print('Bootstrap completed');
  }
}
