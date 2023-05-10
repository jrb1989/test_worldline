import 'package:test_worldline/domain/model/poi_domain_model.dart';
import 'package:dio/dio.dart';

abstract class PoisRemoteDatasource {
  Future<List<PoiDomainModel>> getPois();
}

class PoisRemoteDatasourceImpl implements PoisRemoteDatasource {
  final Dio _dio;

  PoisRemoteDatasourceImpl(this._dio);

  @override
  Future<List<PoiDomainModel>> getPois() async {
    final response = await _dio.get('https://sergiocasero.es/pois.json');
    return List<PoiDomainModel>.from(
      response.data['list']?.map((e) => PoiDomainModel.fromJson(e)),
    );
  }
}
