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
  ///This function is executed when the widget tree has been loaded.
  void onReady() async {
    super.onReady();
    getPois();
  }

  void getPois({bool forceLocal = false}) async {
    //we change the loading status so that the user can see that data is being loaded
    loading = true.obs;

    // request to the repository to get data
    final requestPois = await _repo.getPois(forceLocal: forceLocal);

    // clean list in case it has previous data
    poisList.clear();

    requestPois.fold(
        (value) => print("error"), // show error to load data
        (value) => {poisList.addAll(value!)} ); // add data to the list

    // another list for backup we will need it for the data filterItems()
    savedPoisList.addAll(poisList);

    //update loading status data been loaded or error
    loading = false.obs;

    // update view
    update();
  }

  void deleteList() {
    loading = true.obs;
    //simply clean the list and update the view
    poisList.clear();
    loading = false.obs;
    update();
  }

  void filterItems(String searchText) {
    loading = true.obs;
    // Convert the search text to lowercase for case-insensitive matching
    final String query = searchText.toLowerCase();

    poisList.clear();
   //  we get the original list to filter again
    poisList.addAll(savedPoisList);

    if (searchText.isNotEmpty) {
      // Filter the items based on the title field
      final List<PoiDomainModel> filteredList = poisList.where((item) {
        final String title = item.title.toLowerCase();
        return title.contains(query);
      }).toList();
      poisList.clear();
      poisList.addAll(filteredList);
    }

    // update the view
    loading = false.obs;
    update();
  }
}
