import 'package:flutter/foundation.dart';
import 'package:unsplash_demo/data/api/service/unsplash_random_service.dart';
import 'package:unsplash_demo/data/mapper/tiles_mapper.dart';
import 'package:unsplash_demo/domain/model/tiles.dart';

class ApiUtil {
  UnsplashRandomService unsplashRandomService;
  ApiUtil(this.unsplashRandomService);

  Future<Tiles> getRandomTiles({@required int count}) async {
    final _raw = await unsplashRandomService.getRandomTiles(count);

    return TilesMapper.fromRandomApi(_raw);
  }
}
