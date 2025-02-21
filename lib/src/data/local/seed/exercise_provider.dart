import 'package:flutter/widgets.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

typedef ExerciseProvider = List<Exercise> Function(
    BuildContext, ExerciseType, MeasurementDimension);

List<Exercise> createLegExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(S.of(context).exerciseDeadlift, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseBarbellFrontSquat, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseBarbellSquat, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseBarbellLunge, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellLunge, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseSeatedCalfRaises, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseStandingMachineCalfRaises, dimensions),
      exerciseType.buildExercise(S.of(context).exerciseLegCurls, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseLegExtensions, dimensions)
    ];

List<Exercise> createChestExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(
          S.of(context).exerciseBarbellBenchPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellBenchPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseInclineBarbellBenchPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseInclineDumbbellBenchPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseCableCrossover, dimensions)
    ];

List<Exercise> createBackExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(S.of(context).exercisePullUp, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseHyperextensions, dimensions),
      exerciseType.buildExercise(S.of(context).exerciseBarbellRow, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellRows, dimensions),
      exerciseType.buildExercise(S.of(context).exerciseCableRows, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseInclineCableRows, dimensions)
    ];

List<Exercise> createBicepsExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(S.of(context).exerciseBarbellCurl, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseCamberedBarCurl, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellCurl, dimensions),
      exerciseType.buildExercise(S.of(context).exerciseEZBarCurl, dimensions),
    ];

List<Exercise> createTricepsExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(
          S.of(context).exerciseParallelBarDip, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseVBarPushDown, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseEZBarSkullcrusher, dimensions)
    ];

List<Exercise> createShoulderExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(
          S.of(context).exerciseSeatedShoulderPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseStandingShoulderPress, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellLateralRaise, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseDumbbellFrontRaise, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseBarbellFrontRaise, dimensions),
    ];

List<Exercise> createAbsExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(S.of(context).exerciseDeadBugs, dimensions),
      exerciseType.buildExercise(S.of(context).exercisePlank, dimensions),
      exerciseType.buildExercise(
          S.of(context).exerciseHangingLegRaise, dimensions)
    ];

List<Exercise> createCardioExercises(BuildContext context,
        ExerciseType exerciseType, MeasurementDimension dimensions) =>
    [
      exerciseType.buildExercise(
          S.of(context).exerciseEllipticalMachine, dimensions)
    ];
