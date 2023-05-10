import 'package:get/get.dart';
import 'package:test_worldline/domain/model/poi_domain_model.dart';

import '../controllers/detail_poi_controller.dart';

class DetailPoiBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;

    //we get the data passed through the routing and pass it to the view controller
    final poi = PoiDomainModel(
        id: args['id'],
        title: args['title'],
        latitude: args['latitude'],
        longitude: args['longitude'],
        image: args['image']);

    Get.lazyPut<DetailPoiController>(
      () => DetailPoiController(poi),
    );
  }
}
