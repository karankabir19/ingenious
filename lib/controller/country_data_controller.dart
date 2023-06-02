import 'package:get/get.dart';
import 'package:ingenious_minds_lab_app/services/api_services.dart';

import '../model/country_data_model.dart';

class CountryDataController extends GetxController {
  RxList<CountryData> countryData = <CountryData>[].obs;
  var loading = false.obs;

  Future<void> getCountryData() async {
    loading(true);

    final apiService = APIServices();
    final data = await apiService.getData();
    countryData.value = data.map((item) => CountryData.fromJson(item)).toList();

    loading(false);
  }
}
