import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_worldline/domain/model/poi_domain_model.dart';

import '../../../infrastructure/navigation/routes.dart';

class PoiTile extends StatelessWidget {
  const PoiTile({
    Key? key,
    required this.poi,
  }) : super(key: key);
  final PoiDomainModel poi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_POI, arguments: {
        'id': poi.id,
        'title': poi.title,
        'latitude': poi.latitude,
        'longitude': poi.longitude,
        'image': poi.image
      }),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 80,
                padding: const EdgeInsets.only(
                  top: 11.0,
                  right: 12.0,
                  left: 12.0,
                ),
                child: Center(
                    child: CircleAvatar(
                  backgroundColor: Colors.black,
                  minRadius: 100,
                  child: Text(
                    poi.id,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    poi.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${poi.latitude}, ${poi.longitude}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ]),
    );
  }
}
