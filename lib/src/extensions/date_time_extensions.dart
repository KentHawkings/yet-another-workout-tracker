import 'package:flutter/material.dart';

extension DateTimeUtils on DateTime {
  DateTime get dateOnly => DateUtils.dateOnly(this);

  bool get isCurrentYear => year == DateTime.now().year;

  bool get isToday => DateUtils.isSameDay(this, DateTime.now());

  bool get isTomorrow =>
      DateUtils.isSameDay(this, DateTime.now().add(const Duration(days: 1)));

  bool get isYesterday =>
      DateUtils.isSameDay(this, DateTime.now().add(const Duration(days: -1)));
}
