import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/kilocalories_chart_data.dart';
import 'package:healist_flutter_application/Model/kilocalories_chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KilocaloriesChartWidget extends StatefulWidget {
  final int option;
  const KilocaloriesChartWidget({Key? key, required this.option})
      : super(key: key);

  @override
  State<KilocaloriesChartWidget> createState() =>
      _KilocaloriesChartWidgetState();
}

class _KilocaloriesChartWidgetState extends State<KilocaloriesChartWidget> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: const Color(0xFF1ECF6C),
        format: 'point.x : point.y kcal');
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 300.0,
      child: SfCartesianChart(
          primaryXAxis:
              DateTimeAxis(dateFormat: DateFormat.Md(), desiredIntervals: 6),
          tooltipBehavior: _tooltipBehavior,
          series: <CartesianSeries<KilocaloriesChartModel, DateTime>>[
            SplineSeries<KilocaloriesChartModel, DateTime>(
                dataSource: dataSourceSelection,
                xValueMapper: (KilocaloriesChartModel data, _) => data.dateTime,
                yValueMapper: (KilocaloriesChartModel data, _) =>
                    data.kilocalories,
                name: 'Kilocalorías',
                markerSettings: const MarkerSettings(isVisible: true))
          ]));

  List<KilocaloriesChartModel> get dataSourceSelection {
    if (widget.option == 0) {
      return setKilocaloriesDataList(7);
    } else if (widget.option == 1) {
      return setKilocaloriesDataList(31);
    } else if (widget.option == 2) {
      return setKilocaloriesDataList(91);
    } else if (widget.option == 3) {
      return setKilocaloriesDataList(182);
    } else {
      return setKilocaloriesDataList(365);
    }
  }
}
