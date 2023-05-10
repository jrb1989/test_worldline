import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_worldline/presentation/home/widgets/modal_floating_menu.dart';
import '../global_widgets/custom_app_bar.dart';
import 'controllers/home_controller.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/list_poi_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Pois Stadium',
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () => showMenuModal(context, controller),
            backgroundColor: Colors.greenAccent,
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          body: SafeArea(
              child: _.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 80,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomTextField(
                                onChanged: (value) =>
                                    controller.filterItems(value),
                              ),
                            )),
                        _.poisList.isNotEmpty
                            ? poiListWidget(_.poisList)
                            : _listEmpty(),
                      ],
                    )),
        );
      },
    );
  }

  Widget _listEmpty() {
    return const Center(
        child: Text('No se pudieron cargar los datos inténtalo de nuevo'));
  }
}
