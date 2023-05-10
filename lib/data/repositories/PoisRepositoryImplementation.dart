import 'package:test_worldline/domain/model/poi_domain_model.dart';
import '../../domain/repositories/PoisRepository.dart';
import '../../infrastructure/failures/failures.dart';
import '../../infrastructure/utils/either.dart';
import '../datasources/pois/local/pois_local_datasource.dart';
import '../datasources/pois/remote/pois_remote_datasource.dart';

class PoiRepositoryImpl extends PoisRepository {
  final PoisRemoteDatasource _remote;
  final PoisLocalDatasource _local;

  PoiRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, List<PoiDomainModel>>> getPois({bool forceLocal = false}) async {
    try {
      bool hasPois = await _local.hasPois();
      if (hasPois && forceLocal) {
        return Right(await _local.getPois());
      } else {
        final pois = await _remote.getPois();
        await _local.addPois(pois);
        return Right(pois);
      }
    } catch (e) {
      print(e);
      return Left(const Failure());
    }
  }

  @override
  Future<Either<Failure, void>> clearPois() async{
    try {
      return Right(_local.clearPois());
    } catch (e) {
      return Left(const Failure());
    }
  }

  @override
  Future<Either<Failure, bool>> hasPois() async{
    try {
      return Right(await _local.hasPois());
    } catch (e) {
      return Left(const Failure());
    }
  }
}
