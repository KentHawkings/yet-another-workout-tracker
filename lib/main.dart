import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yet_another_fitness_tracker/objectbox.g.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/data/local/database.dart';
import 'package:yet_another_fitness_tracker/src/data/local/seed/database_seeder.dart';
import 'package:yet_another_fitness_tracker/src/themer.dart';
import 'package:yet_another_fitness_tracker/src/yaft_app.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = SharedPrefs(await SharedPreferences.getInstance());
  var database = Database(await openStore());
  var seeder = DatabaseSeeder(database);
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: seeder),
        Provider.value(value: prefs),
        ChangeNotifierProvider(create: (_) => Themer(prefs)),
        Provider.value(value: DataManager(database))
      ],
      child: const YaftApp(),
    ),
  );
}
