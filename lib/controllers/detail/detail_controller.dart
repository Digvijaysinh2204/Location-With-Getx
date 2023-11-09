import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/model/location_model.dart';
import 'package:location/utility/global_function.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    airportData = Get.arguments;
    kLog(content: airportData.name);
  }

  AirportModel airportData = AirportModel();
}
