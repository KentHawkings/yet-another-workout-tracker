import 'package:flutter_test/flutter_test.dart';
import 'package:yet_another_fitness_tracker/src/utils/hash.dart';

void main() {
  test('hash2 is consistent for the same inputs', () {
    final hashA = hash2('test', 123);
    final hashB = hash2('test', 123);
    expect(hashA, equals(hashB));
  });

  test('hash2 differs for different inputs', () {
    final hashA = hash2('testA', 123);
    final hashB = hash2('testB', 123);
    expect(hashA, isNot(equals(hashB)));
  });
}