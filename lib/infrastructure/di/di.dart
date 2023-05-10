import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_worldline/data/datasources/pois/local/pois_local_datasource.dart';
import 'package:test_worldline/data/datasources/pois/remote/pois_remote_datasource.dart';

import '../../data/repositories/PoisRepositoryImplementation.dart';

class DI {
  DI._();

  static final DI _instance = DI._();
  static DI get instance => _instance;

  Future<void> init() async {
    await _loadDataSources();
    await _loadRepositories();
  }

  Future<void> _loadDataSources() async {
    final database = await openDatabase(
      "pois.db",
      version: 1,
      onCreate: (database, version) async {
        return database.execute('''CREATE TABLE poi(
      id text, title text, geocoordinates text, image text);''');
      },
    );

    final dio = Dio();

    Get.put<PoisLocalDatasource>(
      PoisLocalDatasourceImpl(database),
      permanent: true,
    );

    Get.put<PoisRemoteDatasource>(
      PoisRemoteDatasourceImpl(dio),
      permanent: true,
    );
  }

  Future<void> _loadRepositories() async {
    Get.lazyPut(
          () => PoiRepositoryImpl(Get.find(), Get.find()),
      fenix: true,
    );
  }

}
