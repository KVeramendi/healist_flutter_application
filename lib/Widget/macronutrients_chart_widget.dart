import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/macronutrients_chart_data.dart';
import 'package:healist_flutter_application/Model/macronutrients_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MacronutrientsChartWidget extends StatefulWidget {
  final int option;
  const MacronutrientsChartWidget({Key? key, required this.option})
      : super(key: key);

  @override
  State<MacronutrientsChartWidget> createState() =>
      _MacronutrientsChartWidgetState();
}

class _MacronutrientsChartWidgetState extends State<MacronutrientsChartWidget> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, color: const Color(0xFF1ECF6C));
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 300.0,
      child: SfCartesianChart(
          primaryXAxis:
              DateTimeAxis(dateFormat: DateFormat.Md(), desiredIntervals: 6),
          primaryYAxis: NumericAxis(labelFormat: '{value} g'),
          tooltipBehavior: _tooltipBehavior,
          series: <CartesianSeries<MacronutrientsChartModel, DateTime>>[
            StackedLineSeries<MacronutrientsChartModel, DateTime>(
                dataSource: dataSourceSelection,
                xValueMapper: (MacronutrientsChartModel data, _) =>
                    data.dateTime,
                yValueMapper: (MacronutrientsChartModel data, _) =>
                    data.proteins,
                color: Colors.blueAccent.shade700,
                markerSettings: const MarkerSettings(isVisible: true),
                name: 'Proteínas'),
            StackedLineSeries<MacronutrientsChartModel, DateTime>(
                dataSource: dataSourceSelection,
                xValueMapper: (MacronutrientsChartModel data, _) =>
                    data.dateTime,
                yValueMapper: (MacronutrientsChartModel data, _) =>
                    data.carbohydrates,
                color: Colors.redAccent.shade400,
                markerSettings: const MarkerSettings(isVisible: true),
                name: 'Carbohidratos'),
            StackedLineSeries<MacronutrientsChartModel, DateTime>(
                dataSource: dataSourceSelection,
                xValueMapper: (MacronutrientsChartModel data, _) =>
                    data.dateTime,
                yValueMapper: (MacronutrientsChartModel data, _) => data.fats,
                color: Colors.orangeAccent.shade400,
                markerSettings: const MarkerSettings(isVisible: true),
                name: 'Grasas'),
          ]));

  List<MacronutrientsChartModel> get dataSourceSelection {
    if (widget.option == 0) {
      return setMacronutrientsDataList(7);
    } else if (widget.option == 1) {
      return setMacronutrientsDataList(31);
    } else if (widget.option == 2) {
      return setMacronutrientsDataList(91);
    } else if (widget.option == 3) {
      return setMacronutrientsDataList(182);
    } else {
      return setMacronutrientsDataList(365);
    }
  }
}
