import 'package:flutter_test/flutter_test.dart';
import 'package:yet_another_fitness_tracker/src/extensions/date_time_extensions.dart';

void main() {
  group('Date extension tests', () {
    test('dateOnly removes time', () {
      final date = DateTime(2023, 1, 2, 3, 4);
      expect(date.dateOnly, DateTime(2023, 1, 2));
    });

    test('isCurrentYear matches current year', () {
      final now = DateTime.now();
      expect(now.isCurrentYear, true);
    });

    test('isToday matches current day', () {
      final now = DateTime.now();
      expect(now.isToday, true);
    });

    test('isTomorrow checks next day', () {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      expect(tomorrow.isTomorrow, true);
    });

    test('isYesterday checks previous day', () {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      expect(yesterday.isYesterday, true);
    });
  });
}