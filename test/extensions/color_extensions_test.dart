import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/src/extensions/color_extensions.dart';

void main() {
  group('ColorTransformations', () {
    test('materialColor generates expected swatch size', () {
      const color = Color(0xFF123456);
      final swatch = color.materialColor;
      expect(swatch.shade50, isNotNull);
      expect(swatch.shade900, isNotNull);
      expect(swatch.keys.length, 10);
    });
  });

  group('UseWhiteForeground', () {
    test('useWhiteForeground returns correct value', () {
      const black = Color(0xFF000000);
      const white = Color(0xFFFFFFFF);
      expect(black.useWhiteForeground(), true);
      expect(white.useWhiteForeground(), false);
    });
  });
}
