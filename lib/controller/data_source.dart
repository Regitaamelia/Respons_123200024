import '../service/base_network.dart';

class DataSource {
  static DataSource instance = DataSource();

  Future<Map<String, dynamic>> loadData(String text) {
    return BaseNetwork.get("search.php?s=" + text);
  }

  Future<Map<String, dynamic>> loadDetail(String idMeal) {
    return BaseNetwork.get("lookup.php?i=");
  }
}
