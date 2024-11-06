import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/Themes/darktheme.dart';
import 'package:flutter_template/Utils/UtilsHelper.dart';
import 'package:flutter_template/feature/routing/logger_navigator_observer.dart';
import 'package:flutter_template/feature/routing/screen1.dart';
import 'package:flutter_template/feature/routing/screen2.dart';
import 'package:flutter_template/feature/routing/screen3.dart';
import 'package:flutter_template/feature/routing/screen4.dart';
import 'package:flutter_template/flavors/flavour_config.dart';
import 'package:flutter_template/feature/my_home_page.dart';

import '../Themes/theme.dart';

void main() async {
  const apiKey = String.fromEnvironment('API_KEY');
  if (apiKey.isEmpty) {
    throw AssertionError('API_KEY is not set');
  }
  FlavorConfig(
      flavor: AppFlavors.dev, domainURL: "qa.api.com/v1", apiKey: apiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final local = await getCurrentLocale();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale(local),
      fallbackLocale: const Locale('ar'),
      child: ProviderScope(child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App QA Version',
      navigatorObservers: [
        LoggerNavigatorObserver(),
      ],
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
      routes: {
        '/home': (context) => MyHomePage(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/screen4': (context) {
          return Screen4();
        },
      },
      home: MyHomePage(),
    );
  }
}
