import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/fruits_vegetables_chart_data.dart';
import 'package:healist_flutter_application/Model/fruits_vegetables_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FruitsVegetablesChartWidget extends StatefulWidget {
  final int option;
  const FruitsVegetablesChartWidget({Key? key, required this.option})
      : super(key: key);

  @override
  State<FruitsVegetablesChartWidget> createState() =>
      _FruitsVegetablesChartWidgetState();
}

class _FruitsVegetablesChartWidgetState
    extends State<FruitsVegetablesChartWidget> {
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
          primaryYAxis: NumericAxis(
            labelFormat: '{value} g',
          ),
          tooltipBehavior: _tooltipBehavior,
          series: <CartesianSeries<FruitsVegetablesChartModel, DateTime>>[
            SplineSeries<FruitsVegetablesChartModel, DateTime>(
                dataSource: dataSourceSelection,
                xValueMapper: (FruitsVegetablesChartModel data, _) =>
                    data.dateTime,
                yValueMapper: (FruitsVegetablesChartModel data, _) =>
                    data.fruitsVegetables,
                name: 'Frutas y verduras',
                markerSettings: const MarkerSettings(isVisible: true))
          ]));

  List<FruitsVegetablesChartModel> get dataSourceSelection {
    if (widget.option == 0) {
      return setFruitsVegetablesDataList(7);
    } else if (widget.option == 1) {
      return setFruitsVegetablesDataList(31);
    } else if (widget.option == 2) {
      return setFruitsVegetablesDataList(91);
    } else if (widget.option == 3) {
      return setFruitsVegetablesDataList(182);
    } else {
      return setFruitsVegetablesDataList(365);
    }
  }
}
