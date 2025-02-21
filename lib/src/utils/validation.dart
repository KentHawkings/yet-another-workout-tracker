import 'package:flutter/cupertino.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';

typedef Validator<T> = String? Function(T);

Validator<T> buildValidator<T>({
  required BuildContext context,
  int minLength = -1,
}) =>
    (value) {
      if (value == null) {
        return S.of(context).errorFieldRequired;
      }
      if (minLength > 0 && value.toString().length < minLength) {
        return S.of(context).errorFieldRequired;
      }
      return null;
    };
