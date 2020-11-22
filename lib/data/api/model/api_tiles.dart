import 'package:unsplash_demo/domain/model/tiles.dart';

class ApiTiles {
  List<Tile> tiles;

  ApiTiles.fromRandomApi(List<dynamic> list) {

    int _tempI = list.length;
    List<Tile> _tempTiles = [];

    for (int i = 0; i < _tempI; i++) {
      _tempTiles.add(
        Tile(
            imageUrl: list[i]['urls']['small'],
            thumbUrl: list[i]['urls']['thumb']),
      );
    }
    tiles = _tempTiles;
  }
}
