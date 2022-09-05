import 'package:healist_flutter_application/Model/kilocalories_consumption_model.dart';

class KilocaloriesConsumptionData {
  List<KilocaloriesConsumption> data = [];

  List<KilocaloriesConsumption> kilocaloriesConsumptionList() {
    return data = [
      KilocaloriesConsumption(DateTime(2022, 8, 20), 2444),
      KilocaloriesConsumption(DateTime(2022, 8, 21), 2451),
      KilocaloriesConsumption(DateTime(2022, 8, 22), 2430),
      KilocaloriesConsumption(DateTime(2022, 8, 23), 2420),
      KilocaloriesConsumption(DateTime(2022, 8, 24), 2380),
      KilocaloriesConsumption(DateTime(2022, 8, 25), 2392),
      KilocaloriesConsumption(DateTime(2022, 8, 26), 2399),
      KilocaloriesConsumption(DateTime(2022, 8, 27), 2380),
      KilocaloriesConsumption(DateTime(2022, 8, 28), 2375),
      KilocaloriesConsumption(DateTime(2022, 8, 29), 2398),
      KilocaloriesConsumption(DateTime(2022, 8, 30), 2425),
      KilocaloriesConsumption(DateTime(2022, 8, 31), 2435),
      KilocaloriesConsumption(DateTime(2022, 9, 1), 2429),
      KilocaloriesConsumption(DateTime(2022, 9, 2), 2440),
      KilocaloriesConsumption(DateTime(2022, 9, 3), 2425),
      KilocaloriesConsumption(DateTime(2022, 9, 4), 2432),
      KilocaloriesConsumption(DateTime(2022, 9, 5), 2424),
    ];
  }
}
