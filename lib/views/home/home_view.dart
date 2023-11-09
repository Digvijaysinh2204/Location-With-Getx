import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/controllers/home/home_controller.dart';
import 'package:location/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List")),
      body: GetBuilder<HomeController>(
        assignId: true,
        builder: (logic) {
          return logic.isDataLoad.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                )
              : ListView.builder(
                  itemCount: logic.dataList.length,
                  itemBuilder: (context, index) {
                    var list = logic.dataList[index];
                    return Card(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailView, arguments: list);
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Name : ${list.name}"),
                              Text("ico : ${list.icao}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "City : ${list.city} ,State : ${list.state}"),
                              Text("Country : ${list.country}"),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 18, vertical: 10),
                    ));
                  },
                );
        },
      ),
    );
  }
}
