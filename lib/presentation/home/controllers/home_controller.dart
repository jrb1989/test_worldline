import 'package:get/get.dart';
import 'package:test_worldline/data/repositories/PoisRepositoryImplementation.dart';
import 'package:test_worldline/domain/model/poi_domain_model.dart';

class HomeController extends GetxController {
  late RxList<PoiDomainModel> poisList = <PoiDomainModel>[].obs;
  late RxList<PoiDomainModel> savedPoisList = <PoiDomainModel>[].obs;
  late RxBool loading = true.obs;

  final PoiRepositoryImpl _repo;

  HomeController(this._repo);

  @override
  void onInit() {
    super.onInit();
    poisList.value = [];
  }

  @override
  void onReady() async {
    getPois();
  }

  void getPois({bool forceLocal = false}) async {
    loading = true.obs;
    final requestPois = await _repo.getPois(forceLocal: forceLocal);

    poisList.clear();

    requestPois.fold(
        (value) => print("error"), (value) => {poisList.addAll(value!)});
    savedPoisList.addAll(poisList);
    loading = false.obs;
    update();
  }

  void deleteList() {
    loading = true.obs;
    poisList.clear();
    loading = false.obs;
    update();
  }

  void filterItems(String searchText) {
    loading = true.obs;
    // Convert the search text to lowercase for case-insensitive matching
    final String query = searchText.toLowerCase();

    poisList.clear();
    poisList.addAll(savedPoisList);

    if(searchText.isNotEmpty){
      // Filter the items based on the title field
      final List<PoiDomainModel> filteredList = poisList.where((item) {
        final String title = item.title.toLowerCase();
        return title.contains(query);
      }).toList();
      poisList.clear();
      poisList.addAll(filteredList);
    }

    loading = false.obs;
    update();
  }
}
