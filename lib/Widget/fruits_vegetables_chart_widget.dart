import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/fruits_vegetables_chart_data.dart';
import 'package:healist_flutter_application/Model/fruits_vegetables_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FruitsVegetablesChartWidget extends StatefulWidget {
  const FruitsVegetablesChartWidget({Key? key}) : super(key: key);

  @override
  State<FruitsVegetablesChartWidget> createState() =>
      _FruitsVegetablesChartWidgetState();
}

class _FruitsVegetablesChartWidgetState
    extends State<FruitsVegetablesChartWidget> {
  late List<FruitsVegetablesChartModel> _fruitsVegetablesChartModelList;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _fruitsVegetablesChartModelList = data;
    _tooltipBehavior =
        TooltipBehavior(enable: true, color: Colors.greenAccent.shade700);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            dataSource: _fruitsVegetablesChartModelList,
            xValueMapper: (FruitsVegetablesChartModel data, _) => data.dateTime,
            yValueMapper: (FruitsVegetablesChartModel data, _) =>
                data.fruitsVegetables,
            name: 'Frutas y verduras',
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}