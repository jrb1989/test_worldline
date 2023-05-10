import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../presentation/detail_poi/bindings/detail_poi_binding.dart';
import '../../presentation/detail_poi/views/detail_poi_view.dart';
import '../configuration/config_enviroment.dart';
import '../../presentation/home/bindings/home_binding.dart';
import '../../presentation/screens.dart';
import '../configuration/enviroments.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.production
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.dev ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_POI,
      page: () => const DetailPoiView(),
      binding: DetailPoiBinding(),
    ),
  ];
}
