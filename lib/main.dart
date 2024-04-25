import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superhero_app/providers/app_theme_data.dart';
import 'package:superhero_app/screens/home.dart';
import 'package:superhero_app/util/const.dart';
import 'package:superhero_app/util/theme_config.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeData>(
      builder: (BuildContext context, AppThemeData themeData, Widget? child) {
        return MaterialApp(
          key: themeData.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: themeData.navigatorKey,
          title: Constants.appName,
          theme: themeData.theme,
          darkTheme: ThemeConfig.darkTheme,
          home: Home(),
        );
      },
    );
  }
}
