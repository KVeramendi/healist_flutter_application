import 'package:flutter/material.dart';

class ReminderModel {
  final bool remindersToggle;
  final bool breakfastToggle;
  final TimeOfDay initialBreakfastTimeOfDay;
  final TimeOfDay lastBreakfastTimeOfDay;
  final bool lunchToggle;
  final TimeOfDay initialLunchTimeOfDay;
  final TimeOfDay lastLunchTimeOfDay;
  final bool dinnerToggle;
  final TimeOfDay initialDinnerTimeOfDay;
  final TimeOfDay lastDinnerTimeOfDay;

  ReminderModel(
      {required this.remindersToggle,
      required this.breakfastToggle,
      required this.initialBreakfastTimeOfDay,
      required this.lastBreakfastTimeOfDay,
      required this.lunchToggle,
      required this.initialLunchTimeOfDay,
      required this.lastLunchTimeOfDay,
      required this.dinnerToggle,
      required this.initialDinnerTimeOfDay,
      required this.lastDinnerTimeOfDay});

  static TimeOfDay parseTimeOfDay(String time) {
    final t = time.split('(')[1].split(')')[0];
    return TimeOfDay(
        hour: int.parse(t.split(':')[0]), minute: int.parse(t.split(':')[1]));
  }

  ReminderModel copy(
          {bool? remindersToggle,
          bool? breakfastToggle,
          TimeOfDay? initialBreakfastTimeOfDay,
          TimeOfDay? lastBreakfastTimeOfDay,
          bool? lunchToggle,
          TimeOfDay? initialLunchTimeOfDay,
          TimeOfDay? lastLunchTimeOfDay,
          bool? dinnerToggle,
          TimeOfDay? initialDinnerTimeOfDay,
          TimeOfDay? lastDinnerTimeOfDay}) =>
      ReminderModel(
          remindersToggle: remindersToggle ?? this.remindersToggle,
          breakfastToggle: breakfastToggle ?? this.breakfastToggle,
          initialBreakfastTimeOfDay:
              initialBreakfastTimeOfDay ?? this.initialBreakfastTimeOfDay,
          lastBreakfastTimeOfDay:
              lastBreakfastTimeOfDay ?? this.lastBreakfastTimeOfDay,
          lunchToggle: lunchToggle ?? this.lunchToggle,
          initialLunchTimeOfDay:
              initialLunchTimeOfDay ?? this.initialLunchTimeOfDay,
          lastLunchTimeOfDay: lastLunchTimeOfDay ?? this.lastLunchTimeOfDay,
          dinnerToggle: dinnerToggle ?? this.dinnerToggle,
          initialDinnerTimeOfDay:
              initialDinnerTimeOfDay ?? this.initialDinnerTimeOfDay,
          lastDinnerTimeOfDay: lastDinnerTimeOfDay ?? this.lastDinnerTimeOfDay);

  Map<String, dynamic> toJson() => {
        'remindersToggle': remindersToggle,
        'breakfastToggle': breakfastToggle,
        'initialBreakfastTimeOfDay': initialBreakfastTimeOfDay.toString(),
        'lastBreakfastTimeOfDay': lastBreakfastTimeOfDay.toString(),
        'lunchToggle': lunchToggle,
        'initialLunchTimeOfDay': initialLunchTimeOfDay.toString(),
        'lastLunchTimeOfDay': lastLunchTimeOfDay.toString(),
        'dinnerToggle': dinnerToggle,
        'initialDinnerTimeOfDay': initialDinnerTimeOfDay.toString(),
        'lastDinnerTimeOfDay': lastDinnerTimeOfDay.toString()
      };

  static ReminderModel fromJson(Map<String, dynamic> json) => ReminderModel(
      remindersToggle: json['remindersToggle'],
      breakfastToggle: json['breakfastToggle'],
      initialBreakfastTimeOfDay:
          parseTimeOfDay(json['initialBreakfastTimeOfDay']),
      lastBreakfastTimeOfDay: parseTimeOfDay(json['lastBreakfastTimeOfDay']),
      lunchToggle: json['lunchToggle'],
      initialLunchTimeOfDay: parseTimeOfDay(json['initialLunchTimeOfDay']),
      lastLunchTimeOfDay: parseTimeOfDay(json['lastLunchTimeOfDay']),
      dinnerToggle: json['dinnerToggle'],
      initialDinnerTimeOfDay: parseTimeOfDay(json['initialDinnerTimeOfDay']),
      lastDinnerTimeOfDay: parseTimeOfDay(json['lastDinnerTimeOfDay']));
}
