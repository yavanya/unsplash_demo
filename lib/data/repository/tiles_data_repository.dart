import 'package:unsplash_demo/data/api/api_utils.dart';
import 'package:unsplash_demo/domain/model/tiles.dart';
import 'package:unsplash_demo/domain/repository/tiles_repository.dart';

class TilesDataRepository extends TilesRepository {
  final ApiUtil _apiUtil;

  TilesDataRepository(this._apiUtil);

  @override
  Future<Tiles> getRandomTiles({int count}) {
    return _apiUtil.getRandomTiles(count: count);
  }
}
