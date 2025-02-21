import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

class WeightMeasurementPicker extends StatelessWidget {
  final MeasurementSystem value;
  final ValueChanged<MeasurementSystem?> onChanged;

  const WeightMeasurementPicker({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: MeasurementSystem.values.length,
      itemBuilder: (context, index) {
        MeasurementSystem mode = MeasurementSystem.values[index];
        return RadioListTile(
          title: Text(mode.localizedString(context)),
          value: mode,
          groupValue: value,
          onChanged: onChanged,
        );
      },
    );
  }
}
