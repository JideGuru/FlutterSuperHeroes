import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superhero_app/providers/app_provider.dart';
import 'package:superhero_app/util/theme_config.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              trailing: Switch(
                value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
                    ? false
                    : true,
                  onChanged: (v) {
                    if (v) {
                      Provider.of<AppProvider>(context, listen: false)
                          .setTheme(ThemeConfig.darkTheme, "dark");
                    } else {
                      Provider.of<AppProvider>(context, listen: false)
                          .setTheme(ThemeConfig.lightTheme, "light");
                    }
                  },
                activeColor: Theme.of(context).accentColor,
              ),
            ),
            Divider(),
            SizedBox(height: 10.0),
            Text(
                "Contribute to the Open source project at 'http://www.github.com/JideGuru/FlutterSuperHeroes'"),
          ],
        ),
      ),
    );
  }
}
