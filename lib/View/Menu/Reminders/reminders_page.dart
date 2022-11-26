import 'package:flutter/material.dart';
import 'package:healist_flutter_application/API/scheduled_notification_api.dart';
import 'package:healist_flutter_application/Model/reminder_model.dart';
import 'package:healist_flutter_application/Util/reminder_preferences.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  final _user = UserPreferences.getUser();
  ReminderModel _reminder = ReminderPreferences.getReminder();
  final _notification = ScheduledNotificationAPI();
  late bool _remindersToggle, _breakfastToggle, _lunchToggle, _dinnerToggle;
  late TimeOfDay _initialBreakfastTime,
      _lastBreakfastTime,
      _initialLunchTime,
      _lastLunchTime,
      _initialDinnerTime,
      _lastDinnerTime;

  @override
  void initState() {
    super.initState();
    ScheduledNotificationAPI.init(initScheduled: true);
    // listenNotifications();
    _remindersToggle = _reminder.remindersToggle;
    _breakfastToggle = _reminder.breakfastToggle;
    _initialBreakfastTime = _reminder.initialBreakfastTimeOfDay;
    _lastBreakfastTime = _reminder.lastBreakfastTimeOfDay;
    _lunchToggle = _reminder.lunchToggle;
    _initialLunchTime = _reminder.initialLunchTimeOfDay;
    _lastLunchTime = _reminder.lastLunchTimeOfDay;
    _dinnerToggle = _reminder.dinnerToggle;
    _initialDinnerTime = _reminder.initialDinnerTimeOfDay;
    _lastDinnerTime = _reminder.lastDinnerTimeOfDay;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Center(
          child: Column(children: [
        SwitchListTile(
            value: _remindersToggle,
            onChanged: (value) {
              if (!value) {
                _breakfastToggle = false;
                _lunchToggle = false;
                _dinnerToggle = false;
                _reminder = _reminder.copy(
                    breakfastToggle: false,
                    lunchToggle: false,
                    dinnerToggle: false);
                _notification.cancelAllNotifications();
              }
              _reminder = _reminder.copy(remindersToggle: value);
              ReminderPreferences.setReminder(_reminder);
              setState(() => _remindersToggle = value);
            },
            activeColor: const Color(0xFF1ECF6C),
            title: const Text('Activar recordatorios',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const Text(
                'Habilitar las notificaciones del dispositivo para las 3 comidas',
                style: TextStyle(fontSize: 14.0))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        SwitchListTile(
            value: _breakfastToggle,
            onChanged: (value) {
              _reminder = _reminder.copy(breakfastToggle: value);
              ReminderPreferences.setReminder(_reminder);
              value
                  ? _notification.showScheduledNotification(
                      id: 0,
                      title: 'DESAYUNO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu desayuno hasta la(s) ${_lastBreakfastTime.format(context)}',
                      timeOfDay: _initialBreakfastTime)
                  : _notification.cancelNotification(0);
              setState(() => _breakfastToggle = value);
            },
            activeColor: const Color(0xFF1ECF6C),
            inactiveTrackColor: !_remindersToggle ? Colors.grey.shade300 : null,
            title: Text('Desayuno',
                style: TextStyle(
                    color: !_remindersToggle ? Colors.grey : null,
                    fontSize: 20.0))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _breakfastToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_initialBreakfastTime.format(context),
                      style: TextStyle(
                          color:
                              !_breakfastToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_breakfastToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _initialBreakfastTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour >= _lastBreakfastTime.hour) &&
                      (_newTimeOfDay.minute >= _lastBreakfastTime.minute)) {
                    _lastBreakfastTime = addHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialBreakfastTimeOfDay: _newTimeOfDay,
                      lastBreakfastTimeOfDay: _lastBreakfastTime);
                  setState(() => _initialBreakfastTime = _newTimeOfDay);
                  ReminderPreferences.setReminder(_reminder);
                  _notification.showScheduledNotification(
                      id: 0,
                      title: 'DESAYUNO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu desayuno hasta la(s) ${_lastBreakfastTime.format(context)}',
                      timeOfDay: _initialBreakfastTime);
                }
              }),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Text(':',
              style: TextStyle(
                  color: !_breakfastToggle ? Colors.grey.shade300 : null,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _breakfastToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_lastBreakfastTime.format(context),
                      style: TextStyle(
                          color:
                              !_breakfastToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_breakfastToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _lastBreakfastTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour <= _initialBreakfastTime.hour) &&
                      (_newTimeOfDay.minute <= _initialBreakfastTime.minute)) {
                    _initialBreakfastTime = subHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialBreakfastTimeOfDay: _initialBreakfastTime,
                      lastBreakfastTimeOfDay: _newTimeOfDay);
                  setState(() => _lastBreakfastTime = _newTimeOfDay);
                  ReminderPreferences.setReminder(_reminder);
                  _notification.showScheduledNotification(
                      id: 0,
                      title: 'DESAYUNO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu desayuno hasta la(s) ${_lastBreakfastTime.format(context)}',
                      timeOfDay: _initialBreakfastTime);
                }
              })
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        SwitchListTile(
            value: _lunchToggle,
            onChanged: (value) {
              _reminder = _reminder.copy(lunchToggle: value);
              ReminderPreferences.setReminder(_reminder);
              value
                  ? _notification.showScheduledNotification(
                      id: 1,
                      title: 'ALUMERZO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu almuerzo hasta la(s) ${_lastLunchTime.format(context)}',
                      timeOfDay: _initialLunchTime)
                  : _notification.cancelNotification(1);
              setState(() => _lunchToggle = value);
            },
            activeColor: const Color(0xFF1ECF6C),
            inactiveTrackColor: !_remindersToggle ? Colors.grey.shade300 : null,
            title: Text('Almuerzo',
                style: TextStyle(
                    color: !_remindersToggle ? Colors.grey : null,
                    fontSize: 20.0))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _lunchToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_initialLunchTime.format(context),
                      style: TextStyle(
                          color: !_lunchToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_lunchToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _initialLunchTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour >= _lastLunchTime.hour) &&
                      (_newTimeOfDay.minute >= _lastLunchTime.minute)) {
                    _lastLunchTime = addHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialLunchTimeOfDay: _newTimeOfDay,
                      lastLunchTimeOfDay: _lastLunchTime);
                  ReminderPreferences.setReminder(_reminder);
                  setState(() => _initialLunchTime = _newTimeOfDay);
                  _notification.showScheduledNotification(
                      id: 1,
                      title: 'ALMUERZO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu almuerzo hasta la(s) ${_lastLunchTime.format(context)}',
                      timeOfDay: _initialLunchTime);
                }
              }),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Text(':',
              style: TextStyle(
                  color: !_lunchToggle ? Colors.grey.shade300 : null,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _lunchToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_lastLunchTime.format(context),
                      style: TextStyle(
                          color: !_lunchToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_lunchToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _lastLunchTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour <= _initialLunchTime.hour) &&
                      (_newTimeOfDay.minute <= _initialLunchTime.minute)) {
                    _initialLunchTime = subHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialLunchTimeOfDay: _initialLunchTime,
                      lastLunchTimeOfDay: _newTimeOfDay);
                  ReminderPreferences.setReminder(_reminder);
                  setState(() => _lastLunchTime = _newTimeOfDay);
                  _notification.showScheduledNotification(
                      id: 1,
                      title: 'ALMUERZO',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu almuerzo hasta la(s) ${_lastLunchTime.format(context)}',
                      timeOfDay: _initialLunchTime);
                }
              })
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        SwitchListTile(
            value: _dinnerToggle,
            onChanged: (value) {
              _reminder = _reminder.copy(dinnerToggle: value);
              ReminderPreferences.setReminder(_reminder);
              value
                  ? _notification.showScheduledNotification(
                      id: 2,
                      title: 'CENA',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu cena hasta la(s) ${_lastDinnerTime.format(context)}',
                      timeOfDay: _initialDinnerTime)
                  : _notification.cancelNotification(2);
              setState(() => _dinnerToggle = value);
            },
            activeColor: const Color(0xFF1ECF6C),
            inactiveTrackColor: !_remindersToggle ? Colors.grey.shade300 : null,
            title: Text('Cena',
                style: TextStyle(
                    color: !_remindersToggle ? Colors.grey : null,
                    fontSize: 20.0))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _dinnerToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_initialDinnerTime.format(context),
                      style: TextStyle(
                          color: !_dinnerToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_dinnerToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _initialDinnerTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour >= _lastDinnerTime.hour) &&
                      (_newTimeOfDay.minute >= _lastDinnerTime.minute)) {
                    _lastDinnerTime = addHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialDinnerTimeOfDay: _newTimeOfDay,
                      lastDinnerTimeOfDay: _lastDinnerTime);
                  ReminderPreferences.setReminder(_reminder);
                  setState(() => _initialDinnerTime = _newTimeOfDay);
                  _notification.showScheduledNotification(
                      id: 2,
                      title: 'CENA',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu cena hasta la(s) ${_lastDinnerTime.format(context)}',
                      timeOfDay: _initialDinnerTime);
                }
              }),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Text(':',
              style: TextStyle(
                  color: !_dinnerToggle ? Colors.grey.shade300 : null,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _dinnerToggle
                              ? const Color(0xFF1ECF6C)
                              : Colors.grey.shade300,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130.0,
                  height: 45.0,
                  child: Text(_lastDinnerTime.format(context),
                      style: TextStyle(
                          color: !_dinnerToggle ? Colors.grey.shade400 : null,
                          fontSize: 24.0))),
              onTap: () async {
                if (_dinnerToggle) {
                  TimeOfDay? _newTimeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _lastDinnerTime,
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'SELECCIONE LA HORA');
                  if (_newTimeOfDay == null) return;
                  if ((_newTimeOfDay.hour <= _initialDinnerTime.hour) &&
                      (_newTimeOfDay.minute <= _initialDinnerTime.minute)) {
                    _initialDinnerTime = subHour(_newTimeOfDay);
                  }
                  _reminder = _reminder.copy(
                      initialDinnerTimeOfDay: _initialDinnerTime,
                      lastDinnerTimeOfDay: _newTimeOfDay);
                  ReminderPreferences.setReminder(_reminder);
                  setState(() => _lastDinnerTime = _newTimeOfDay);
                  _notification.showScheduledNotification(
                      id: 2,
                      title: 'CENA',
                      body:
                          'Hola ${_user.fullName}! Es hora de empezar tu cena hasta la(s) ${_lastDinnerTime.format(context)}',
                      timeOfDay: _initialDinnerTime);
                }
              })
        ])
      ])));

  TimeOfDay addHour(TimeOfDay time, {int hours = 1, int minutes = 0}) =>
      TimeOfDay(
          hour: time.hour + hours + minutes ~/ 60,
          minute: time.minute + minutes % 60);

  TimeOfDay subHour(TimeOfDay time, {int hours = 1, int minutes = 0}) =>
      TimeOfDay(
          hour: (time.hour - hours - minutes ~/ 60).abs(),
          minute: time.minute - minutes % 60);

  void listenNotifications() =>
      ScheduledNotificationAPI.onScheduledNotification.stream
          .listen(onClickedNotification);

  void onClickedNotification(String? payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
