import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/ui/home/home_page.dart';
import 'package:yet_another_fitness_tracker/src/themer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';

class YaftApp extends StatelessWidget {
  const YaftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Themer>(
      builder: (context, themer, _) {
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
