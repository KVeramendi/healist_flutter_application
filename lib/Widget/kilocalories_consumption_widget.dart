import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/kilocalories_consumption_data.dart';
import 'package:healist_flutter_application/Model/kilocalories_consumption_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KilocaloriesConsumptionWidget extends StatefulWidget {
  const KilocaloriesConsumptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KilocaloriesConsumptionWidget> createState() =>
      _KilocaloriesConsumptionWidgetState();
}

class _KilocaloriesConsumptionWidgetState
    extends State<KilocaloriesConsumptionWidget> {
  List<KilocaloriesConsumption> kilocaloriesConsumptionList = [];

  @override
  void initState() {
    super.initState();
    kilocaloriesConsumptionList =
        KilocaloriesConsumptionData().kilocaloriesConsumptionList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: SfCartesianChart(
        primaryXAxis:
            DateTimeAxis(dateFormat: DateFormat.Md(), desiredIntervals: 6),
        primaryYAxis: CategoryAxis(isVisible: false),
        series: <CartesianSeries<KilocaloriesConsumption, DateTime>>[
          FastLineSeries<KilocaloriesConsumption, DateTime>(
              dataSource: kilocaloriesConsumptionList,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              xValueMapper: (KilocaloriesConsumption data, _) => data.dateTime,
              yValueMapper: (KilocaloriesConsumption data, _) =>
                  data.kilocaloriesValue)
        ],
      ),
    );
  }
}
