
import 'package:test_worldline/domain/model/poi_domain_model.dart';

import '../../infrastructure/failures/failures.dart';
import '../../infrastructure/utils/either.dart';

abstract class PoisRepository{
  @override
  Future<Either<Failure,List<PoiDomainModel>>> getPois({bool forceLocal});

  @override
  Future<Either<Failure,void>> clearPois();

  @override
  Future<Either<Failure,bool>> hasPois();
}