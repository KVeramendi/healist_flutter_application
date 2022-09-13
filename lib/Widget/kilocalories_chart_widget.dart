import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/kilocalories_chart_data.dart';
import 'package:healist_flutter_application/Model/kilocalories_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KilocaloriesChartWidget extends StatefulWidget {
  const KilocaloriesChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KilocaloriesChartWidget> createState() =>
      _KilocaloriesChartWidgetState();
}

class _KilocaloriesChartWidgetState extends State<KilocaloriesChartWidget> {
  late List<KilocaloriesChartModel> _kilocaloriesChartModelList;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _kilocaloriesChartModelList = data;
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: Colors.greenAccent.shade700,
        format: 'point.x : point.y kcal');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.0,
        child: SfCartesianChart(
            primaryXAxis:
                DateTimeAxis(dateFormat: DateFormat.Md(), desiredIntervals: 6),
            tooltipBehavior: _tooltipBehavior,
            series: <CartesianSeries<KilocaloriesChartModel, DateTime>>[
              SplineSeries<KilocaloriesChartModel, DateTime>(
                  dataSource: _kilocaloriesChartModelList,
                  xValueMapper: (KilocaloriesChartModel data, _) =>
                      data.dateTime,
                  yValueMapper: (KilocaloriesChartModel data, _) =>
                      data.kilocalories,
                  name: 'Kilocalorías',
                  markerSettings: const MarkerSettings(isVisible: true))
            ]));
  }
}
