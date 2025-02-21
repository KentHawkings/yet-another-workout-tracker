import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/local/seed/database_seeder.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/ui/home/home_page.dart';
import 'package:yet_another_fitness_tracker/src/themer.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class YaftApp extends StatelessWidget {
  const YaftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Themer>(
      builder: (context, themer, _) {
        var prefs = Provider.of<SharedPrefs>(context);
        var seeder = Provider.of<DatabaseSeeder>(context);
        if (!prefs.dbSeeded) {
          seeder.seed(context).then((_) => prefs.setDbSeeded(true));
        }
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          themeMode: themer.themeMode,
          darkTheme: themer.getDarkTheme(context),
          theme: themer.getLightTheme(context),
          home: HomePage.build(context),
        );
      },
    );
  }
}
