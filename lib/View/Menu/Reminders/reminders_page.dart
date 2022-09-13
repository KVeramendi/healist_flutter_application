import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  TimeOfDay _initialBreakfastTimeOfDay = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _lastBreakfastTimeOfDay = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _initialLunchTimeOfDay = const TimeOfDay(hour: 13, minute: 0);
  TimeOfDay _lastLunchTimeOfDay = const TimeOfDay(hour: 14, minute: 0);
  TimeOfDay _initialDinnerTimeOfDay = const TimeOfDay(hour: 19, minute: 0);
  TimeOfDay _lastDinnerTimeOfDay = const TimeOfDay(hour: 20, minute: 0);
  bool _remindersToggle = false;
  bool _breakfastToggle = false;
  bool _lunchToggle = false;
  bool _dinnerToggle = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
            child: Center(
                child: Column(children: [
              SwitchListTile(
                  value: _remindersToggle,
                  onChanged: (value) => setState(() {
                        _remindersToggle = value;
                        if (!_remindersToggle) {
                          _breakfastToggle = false;
                          _lunchToggle = false;
                          _dinnerToggle = false;
                        }
                      }),
                  activeColor: Colors.greenAccent.shade700,
                  title: const Text('Activar recordatorios',
                      style: TextStyle(fontSize: 20.0)),
                  subtitle: const Text(
                      'Habilitar las notificaciones del dispositivo para las 3 comidas',
                      style: TextStyle(fontSize: 14.0))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              SwitchListTile(
                value: _breakfastToggle,
                onChanged: (value) => setState(() {
                  if (_remindersToggle) {
                    _breakfastToggle = value;
                  } else {
                    _breakfastToggle = false;
                  }
                }),
                activeColor: Colors.greenAccent.shade700,
                inactiveTrackColor:
                    !_remindersToggle ? Colors.grey.shade300 : null,
                title: Text('Desayuno',
                    style: TextStyle(
                        color: !_remindersToggle ? Colors.grey : null,
                        fontSize: 20.0)),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: _breakfastToggle
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_initialBreakfastTimeOfDay.format(context),
                            style: TextStyle(
                                color: !_breakfastToggle
                                    ? Colors.grey.shade400
                                    : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_breakfastToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _initialBreakfastTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _initialBreakfastTimeOfDay = _newTimeOfDay;
                          if ((_initialBreakfastTimeOfDay.hour >=
                                  _lastBreakfastTimeOfDay.hour) &&
                              (_initialBreakfastTimeOfDay.minute >=
                                  _lastBreakfastTimeOfDay.minute)) {
                            _lastBreakfastTimeOfDay =
                                addHour(_initialBreakfastTimeOfDay);
                          }
                        });
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
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_lastBreakfastTimeOfDay.format(context),
                            style: TextStyle(
                                color: !_breakfastToggle
                                    ? Colors.grey.shade400
                                    : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_breakfastToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _lastBreakfastTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _lastBreakfastTimeOfDay = _newTimeOfDay;
                          if ((_lastBreakfastTimeOfDay.hour <=
                                  _initialBreakfastTimeOfDay.hour) &&
                              (_lastBreakfastTimeOfDay.minute <=
                                  _initialBreakfastTimeOfDay.minute)) {
                            _initialBreakfastTimeOfDay =
                                subHour(_lastBreakfastTimeOfDay);
                          }
                        });
                      }
                    })
              ]),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              SwitchListTile(
                  value: _lunchToggle,
                  onChanged: (value) => setState(() {
                        if (_remindersToggle) {
                          _lunchToggle = value;
                        } else {
                          _lunchToggle = false;
                        }
                      }),
                  activeColor: Colors.greenAccent.shade700,
                  inactiveTrackColor:
                      !_remindersToggle ? Colors.grey.shade300 : null,
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
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_initialLunchTimeOfDay.format(context),
                            style: TextStyle(
                                color:
                                    !_lunchToggle ? Colors.grey.shade400 : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_lunchToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _initialLunchTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _initialLunchTimeOfDay = _newTimeOfDay;
                          if ((_initialLunchTimeOfDay.hour >=
                                  _lastLunchTimeOfDay.hour) &&
                              (_initialLunchTimeOfDay.minute >=
                                  _lastLunchTimeOfDay.minute)) {
                            _lastLunchTimeOfDay =
                                addHour(_initialLunchTimeOfDay);
                          }
                        });
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
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_lastLunchTimeOfDay.format(context),
                            style: TextStyle(
                                color:
                                    !_lunchToggle ? Colors.grey.shade400 : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_lunchToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _lastLunchTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _lastLunchTimeOfDay = _newTimeOfDay;
                          if ((_lastLunchTimeOfDay.hour <=
                                  _initialLunchTimeOfDay.hour) &&
                              (_lastLunchTimeOfDay.minute <=
                                  _initialLunchTimeOfDay.minute)) {
                            _initialLunchTimeOfDay =
                                subHour(_lastLunchTimeOfDay);
                          }
                        });
                      }
                    })
              ]),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              SwitchListTile(
                  value: _dinnerToggle,
                  onChanged: (value) => setState(() {
                        if (_remindersToggle) {
                          _dinnerToggle = value;
                        } else {
                          _dinnerToggle = false;
                        }
                      }),
                  activeColor: Colors.greenAccent.shade700,
                  inactiveTrackColor:
                      !_remindersToggle ? Colors.grey.shade300 : null,
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
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_initialDinnerTimeOfDay.format(context),
                            style: TextStyle(
                                color: !_dinnerToggle
                                    ? Colors.grey.shade400
                                    : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_dinnerToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _initialDinnerTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _initialDinnerTimeOfDay = _newTimeOfDay;
                          if ((_initialDinnerTimeOfDay.hour >=
                                  _lastDinnerTimeOfDay.hour) &&
                              (_initialDinnerTimeOfDay.minute >=
                                  _lastDinnerTimeOfDay.minute)) {
                            _lastDinnerTimeOfDay =
                                addHour(_initialDinnerTimeOfDay);
                          }
                        });
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
                                    ? Colors.greenAccent.shade700
                                    : Colors.grey.shade300,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 130.0,
                        height: 45.0,
                        child: Text(_lastDinnerTimeOfDay.format(context),
                            style: TextStyle(
                                color: !_dinnerToggle
                                    ? Colors.grey.shade400
                                    : null,
                                fontSize: 24.0))),
                    onTap: () async {
                      if (_dinnerToggle) {
                        TimeOfDay? _newTimeOfDay = await showTimePicker(
                            context: context,
                            initialTime: _lastDinnerTimeOfDay,
                            cancelText: 'Cancelar',
                            confirmText: 'Aceptar',
                            helpText: 'SELECCIONE LA HORA');
                        if (_newTimeOfDay == null) return;
                        setState(() {
                          _lastDinnerTimeOfDay = _newTimeOfDay;
                          if ((_lastDinnerTimeOfDay.hour <=
                                  _initialDinnerTimeOfDay.hour) &&
                              (_lastDinnerTimeOfDay.minute <=
                                  _initialDinnerTimeOfDay.minute)) {
                            _initialDinnerTimeOfDay =
                                subHour(_lastDinnerTimeOfDay);
                          }
                        });
                      }
                    })
              ])
            ]))));
  }

  TimeOfDay addHour(TimeOfDay time, {int hours = 1, int minutes = 0}) =>
      TimeOfDay(
          hour: time.hour + hours + minutes ~/ 60,
          minute: time.minute + minutes % 60);

  TimeOfDay subHour(TimeOfDay time, {int hours = 1, int minutes = 0}) =>
      TimeOfDay(
          hour: (time.hour - hours - minutes ~/ 60).abs(),
          minute: time.minute - minutes % 60);
}
