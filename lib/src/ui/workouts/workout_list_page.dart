import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yet_another_fitness_tracker/src/ui/workouts/workout_page.dart';

class WorkoutListPage extends StatefulWidget {
  static Widget build() {
    return const WorkoutListPage();
  }

  const WorkoutListPage({Key? key}) : super(key: key);

  @override
  State<WorkoutListPage> createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage>
    with AutomaticKeepAliveClientMixin {
  static const int _initialPage = 100;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: _initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return WorkoutPage.build(
            DateTime.now().add(Duration(days: index - _initialPage)),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
