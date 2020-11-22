import 'package:flutter/foundation.dart';
import 'package:unsplash_demo/domain/model/tiles.dart';

abstract class TilesRepository {
  Future<Tiles> getRandomTiles({@required int count});
}
