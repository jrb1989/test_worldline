import 'package:test_worldline/domain/model/poi_domain_model.dart';
import 'package:sqflite/sqflite.dart';


abstract class PoisLocalDatasource {
  Future<List<PoiDomainModel>> getPois();

  Future<bool> hasPois();

  Future<void> clearPois();

  Future<void> addPois(List<PoiDomainModel> pois);
}

class PoisLocalDatasourceImpl implements PoisLocalDatasource {

  final Database _db;
  PoisLocalDatasourceImpl(this._db);

  @override
  Future<void> addPois(List<PoiDomainModel> pois) async {
    final batch = _db.batch();
    for (var element in pois) {
      batch.insert("poi", element.toJson());
    }
    await batch.commit();
  }

  @override
  Future<void> clearPois() async {
    await _db.delete("poi");
  }

  @override
  Future<List<PoiDomainModel>> getPois() async {
    final result = await _db.query("poi");
    return result.map((e) => PoiDomainModel.fromJson(e)).toList();
  }

  @override
  Future<bool> hasPois() async {
    return (await getPois()).isNotEmpty;
  }

}