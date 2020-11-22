import 'package:unsplash_demo/data/repository/tiles_data_repository.dart';
import 'package:unsplash_demo/domain/repository/tiles_repository.dart';
import 'package:unsplash_demo/modules/api_module.dart';

class RepositoryModule {
  static TilesRepository _tilesRepository;

  static TilesRepository tilesRepository() {
    if (_tilesRepository == null) {
      _tilesRepository = TilesDataRepository(ApiModule.apiUtil());
    }
    return _tilesRepository;
  }
}
