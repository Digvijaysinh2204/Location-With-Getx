import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/model/location_model.dart';
import '../../controllers/detail/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: GetBuilder<DetailController>(
        assignId: true,
        builder: (logic) {
          var data = logic.airportData;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(data.lat, data.lon),
                    zoom: 5,
                  ),
                  mapType: MapType.normal,
                  markers: {
                    Marker(
                        markerId: MarkerId(data.city.toString()),
                        position: LatLng(data.lat, data.lon))
                  },
                ),
              ).paddingOnly(bottom: 50),
              Text("Name : ${data.name}", style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
              Text("Icao : ${data.icao}", style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
              Text("City, : ${data.city}", style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
              Text("State : ${data.state}",
                      style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
              Text("Country : ${data.country}",
                      style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
              Text("Tz : ${data.tz}", style: const TextStyle(fontSize: 20))
                  .paddingSymmetric(vertical: 10),
            ],
          );
        },
      ),
    );
  }
}
