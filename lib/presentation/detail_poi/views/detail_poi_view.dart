import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_worldline/presentation/global_widgets/custom_app_bar.dart';

import '../../../../presentation/detail_poi/controllers/detail_poi_controller.dart';

class DetailPoiView extends GetView<DetailPoiController> {
  const DetailPoiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Poi detail', backRoute: '/home',),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                controller.poi.title,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20,),
            Text('Latitud :  ${controller.poi.latitude}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20,),
            Text('Longitud :  ${controller.poi.longitude}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20,),

            Center(child: Image.network(controller.poi.image, height: 150, width: 150,)),
          ],
        ),
      ),
    );
  }
}
