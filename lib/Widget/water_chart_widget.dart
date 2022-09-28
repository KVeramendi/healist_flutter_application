import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/water_chart_data.dart';
import 'package:healist_flutter_application/Model/water_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterChartWidget extends StatefulWidget {
  const WaterChartWidget({Key? key}) : super(key: key);

  @override
  State<WaterChartWidget> createState() => _WaterChartWidgetState();
}

class _WaterChartWidgetState extends State<WaterChartWidget> {
  late List<WaterChartModel> _waterChartModelList;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _waterChartModelList = data;
    _tooltipBehavior =
        TooltipBehavior(enable: true, color: const Color(0xFF1ECF6C));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.0,
        child: SfCartesianChart(
            primaryXAxis:
                DateTimeAxis(dateFormat: DateFormat.Md(), desiredIntervals: 6),
            primaryYAxis: NumericAxis(labelFormat: '{value} L'),
            tooltipBehavior: _tooltipBehavior,
            series: <CartesianSeries<WaterChartModel, DateTime>>[
              SplineSeries<WaterChartModel, DateTime>(
                  dataSource: _waterChartModelList,
                  xValueMapper: (WaterChartModel data, _) => data.dateTime,
                  yValueMapper: (WaterChartModel data, _) => data.water,
                  name: 'Hidratación',
                  markerSettings: const MarkerSettings(isVisible: true))
            ]));
  }
}
