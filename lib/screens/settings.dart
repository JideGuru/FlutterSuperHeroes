import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:superhero_app/providers/app_theme_data.dart';
import 'package:superhero_app/util/theme_config.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => setTheme(),
    );
  }

  setTheme() {
    // If system is dark mode then mak ethe switch widget switched on
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      Provider.of<AppThemeData>(context, listen: false)
          .setTheme(ThemeConfig.darkTheme, "dark");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: const Text("Use the dark mode"),
              trailing: Switch(
                value: Provider.of<AppThemeData>(context).theme ==
                        ThemeConfig.lightTheme
                    ? false
                    : true,
                onChanged: (v) {
                  if (MediaQuery.of(context).platformBrightness !=
                      Brightness.dark) {
                    if (v) {
                      Provider.of<AppThemeData>(context, listen: false)
                          .setTheme(ThemeConfig.darkTheme, "dark");
                    } else {
                      Provider.of<AppThemeData>(context, listen: false)
                          .setTheme(ThemeConfig.lightTheme, "light");
                    }
                  }
                },
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
