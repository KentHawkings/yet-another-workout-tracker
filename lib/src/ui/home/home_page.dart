import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/local/seed/database_seeder.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/animated_fab.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/ui/exercises/exercise_type_list_page.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/ui/home/home_view_model.dart';
import 'package:yet_another_fitness_tracker/src/ui/settings/settings_page.dart';
import 'package:yet_another_fitness_tracker/src/ui/workouts/workout_list_page.dart';

class HomePage extends StatefulWidget {
  static Widget build(BuildContext context) {
    return Provider(
      create: (_) => HomeViewModel(),
      child: Builder(
        builder: (context) {
          var prefs = Provider.of<SharedPrefs>(context);
          var seeder = Provider.of<DatabaseSeeder>(context);
          if (!prefs.dbSeeded) {
            seeder.seed(context).then((_) => prefs.setDbSeeded(true));
          }
          return const HomePage();
        },
      ),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewModelState<HomePage, HomeViewModel> {
  final List<Widget> _pages = [
    WorkoutListPage.build(),
    SettingsPage.build(),
  ];

  late PageController _controller;

  final GlobalKey _fabKey = GlobalKey();
  final bool _fabVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.transparent,
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Dimens.borderRadius),
        ),
        child: _createBottomNavigationBar(context),
      ),
      floatingActionButton: _createFloatingActionButton(context),
    );
  }

  Widget _createFloatingActionButton(BuildContext context) {
    return viewModelConsumer(
      builder: (context, viewModel, _) {
        return Visibility(
          visible: _fabVisible,
          child: AnimatedFAB(
            tooltip: S.of(context).addNewExercise,
            isVisible: viewModel.showFab,
            onPressed: () {
              _onClickFab(context);
            },
            child: const Icon(FeatherIcons.plus),
            key: _fabKey,
          ),
        );
      },
    );
  }

  Widget _createBottomNavigationBar(BuildContext context) {
    return viewModelConsumer(
      builder: (context, viewModel, _) {
        EdgeInsets insets = const EdgeInsets.only(
          bottom: Dimens.spaceSmall,
          top: Dimens.spaceNormal,
          left: Dimens.spaceNormal,
          right: Dimens.spaceNormal,
        );

        return BottomAppBar(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.currentIndex,
            onTap: (index) {
              _controller.jumpToPage(index);
              viewModel.setCurrentIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                label: S.of(context).navigationWorkouts,
                icon: Container(
                  padding: insets,
                  child: const Icon(FeatherIcons.activity),
                ),
              ),
              BottomNavigationBarItem(
                label: S.of(context).navigationSettings,
                icon: Container(
                  padding: insets,
                  child: const Icon(FeatherIcons.settings),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onClickFab(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ExerciseTypeListPage.build,
      ),
    );
  }
}
