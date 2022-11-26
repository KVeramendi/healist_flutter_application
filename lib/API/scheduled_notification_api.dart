import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ScheduledNotificationAPI {
  static final _scheduledNotification = FlutterLocalNotificationsPlugin();
  static final onScheduledNotification = BehaviorSubject<String>();

  Future showNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _scheduledNotification.show(id, title, body, await _notificationDetails(),
          payload: payload);

  Future showScheduledNotification(
          {required int id,
          String? title,
          String? body,
          String? payload,
          required TimeOfDay timeOfDay}) async =>
      _scheduledNotification.zonedSchedule(id, title, body,
          _scheduledDaily(timeOfDay), await _notificationDetails(),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  static tz.TZDateTime _scheduledDaily(TimeOfDay time) {
    final _now = tz.TZDateTime.now(tz.local);
    final _scheduledDate = tz.TZDateTime(
        tz.local, _now.year, _now.month, _now.day, time.hour, time.minute);
    return _scheduledDate.isBefore(_now)
        ? _scheduledDate.add(const Duration(days: 1))
        : _scheduledDate;
  }

  static Future _notificationDetails() async => const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          importance: Importance.defaultImportance,
          styleInformation: BigTextStyleInformation(''),
          color: Color(0xFF1ECF6C)));

  static Future init({bool initScheduled = false}) async {
    const _android = AndroidInitializationSettings('notification_icon');
    const _settings = InitializationSettings(android: _android);
    await _scheduledNotification.initialize(
      _settings,
      onSelectNotification: (payload) => onScheduledNotification.add(payload!),
    );
    if (initScheduled) {
      tz.initializeTimeZones();
      final _locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(_locationName));
    }
  }

  void cancelNotification(int id) => _scheduledNotification.cancel(id);

  void cancelAllNotifications() => _scheduledNotification.cancelAll();
}
