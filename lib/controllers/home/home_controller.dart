import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:location/api/api_list.dart';
import 'package:location/api/api_method.dart';
import 'package:location/model/location_model.dart';
import 'package:location/utility/global_function.dart';

import '../../db/local_store_data.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    getDataLocal();
    super.onInit();
  }

  RxBool isDataLoad = true.obs;
  var dataList = <AirportModel>[].obs;
  Future getApiData() async {
    dataList.clear();
    const url = ApiList.url;
    final response = await callGetApi(endURl: url);
    if (response.statusCode == 200) {
      isDataLoad.value = false;
      Map<String, dynamic> decode = jsonDecode(response.body);
      decode.forEach((key, value) async {
        AirportModel airport = AirportModel.fromJson(value);
        await dbHelper.insertAirport(airport);
      });
      dataList.value = await dbHelper.getAirports();
      kLog(content: decode.length);
    } else {
      isDataLoad.value = true;
    }
    update();
  }

  DatabaseHelper dbHelper = DatabaseHelper.instance;
  getDataLocal() async {
    dataList.clear();
    dataList.value = await dbHelper.getAirports();
    try {
      if (dataList.isEmpty) {
        isDataLoad.value = true;
        kLog(content: "Get Api Data");
        getApiData();
      } else {
        kLog(content: "Get Local Data");

        isDataLoad.value = false;
      }
    } on SocketException catch (e) {
      kLog(content: "Database Exception $e");
      throw "No Database found";
    } finally {}
    update();
  }
}
