import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superhero_app/util/theme_config.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    checkTheme();
  }

  ThemeData theme = ThemeConfig.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  void setTheme(value, c) {
    theme = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("theme", c).then((val) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor:
              c == "dark" ? ThemeConfig.darkPrimary : ThemeConfig.lightPrimary,
          statusBarIconBrightness:
              c == "dark" ? Brightness.light : Brightness.dark,
        ));
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r = prefs.getString("theme") ?? "light";

    if (r == "light") {
      t = ThemeConfig.lightTheme;
      setTheme(ThemeConfig.lightTheme, "light");
    } else {
      t = ThemeConfig.darkTheme;
      setTheme(ThemeConfig.darkTheme, "dark");
    }

    return t;
  }
}
