import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/reminder_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderPreferences {
  static late SharedPreferences _sharedPreferences;
  static const _keyReminder = 'reminder';
  static ReminderModel myReminder = ReminderModel(
      remindersToggle: false,
      breakfastToggle: false,
      initialBreakfastTimeOfDay: const TimeOfDay(hour: 8, minute: 0),
      lastBreakfastTimeOfDay: const TimeOfDay(hour: 9, minute: 0),
      lunchToggle: false,
      initialLunchTimeOfDay: const TimeOfDay(hour: 13, minute: 0),
      lastLunchTimeOfDay: const TimeOfDay(hour: 14, minute: 0),
      dinnerToggle: false,
      initialDinnerTimeOfDay: const TimeOfDay(hour: 19, minute: 0),
      lastDinnerTimeOfDay: const TimeOfDay(hour: 20, minute: 0));

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setReminder(ReminderModel reminder) async {
    final json = jsonEncode(reminder.toJson());
    await _sharedPreferences.setString(_keyReminder, json);
  }

  static ReminderModel getReminder() {
    final json = _sharedPreferences.getString(_keyReminder);
    return json == null ? myReminder : ReminderModel.fromJson(jsonDecode(json));
  }
}
