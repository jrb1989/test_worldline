import 'package:flutter/material.dart';
import 'package:test_worldline/presentation/home/widgets/poi_tile.dart';

import '../../../domain/model/poi_domain_model.dart';

Widget poiListWidget(List<PoiDomainModel> list) {
  return Expanded(
    child: ListView.separated(
      shrinkWrap: true,
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
            color: Colors.black, height: 5, thickness: 1.5);
      },
      itemBuilder: (ctx, index) {
        final poi = list[index];
        return PoiTile(
          poi: poi,
        );
      },
    ),
  );
}
