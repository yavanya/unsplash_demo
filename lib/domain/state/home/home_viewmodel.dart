import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:unsplash_demo/data/repository/tiles_data_repository.dart';
import 'package:unsplash_demo/domain/model/tiles.dart';
import 'package:unsplash_demo/modules/repository_module.dart';

class HomeViewModel extends FutureViewModel {
  TilesDataRepository _tilesRepositiry = RepositoryModule.tilesRepository();

  Tiles _randomTiles;
  Tiles get tiles => _randomTiles;

  int _count = 20;
  int get count => _count;
  set count(int i) {
    _count = i;
    notifyListeners();
  }

  Future<void> getRandomTiles({@required int count}) async {
    _randomTiles = await _tilesRepositiry.getRandomTiles(count: count);
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    await getRandomTiles(count: _count);
  }
}
