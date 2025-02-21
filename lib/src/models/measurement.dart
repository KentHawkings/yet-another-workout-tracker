import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/utils/hash.dart';

@Entity()
class MeasurementDimension {
  int id = 0;

  @Unique()
  String name;

  int dimensionality;

  MeasurementDimension({name, dimensionality})
      : name = name ?? '',
        dimensionality = dimensionality ?? 2;

  @override
  int get hashCode => hash2(id, name);

  @override
  bool operator ==(Object other) {
    if (other is! MeasurementDimension) {
      return false;
    }
    return (other).id == id;
  }
}

enum MeasurementSystem { metric, imperial }

extension WeightMeasurementSystemId on MeasurementSystem {
  int get id {
    switch (this) {
      case MeasurementSystem.metric:
        return 0;
      case MeasurementSystem.imperial:
        return 1;
    }
  }
}

extension WeightMeasurementLocalization on MeasurementSystem {
  String localizedString(BuildContext context) {
    switch (this) {
      case MeasurementSystem.imperial:
        return S.of(context).weightMeasurementImperial;
      case MeasurementSystem.metric:
        return S.of(context).weightMeasurementMetric;
    }
  }
}
