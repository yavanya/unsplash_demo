  //в этом приложении не имеет особого смысла, 
  //сделал это ради универсальности,
  //вдруг попросите другой сервис картинок подключить =)
import 'package:unsplash_demo/data/api/model/api_tiles.dart';
import 'package:unsplash_demo/domain/model/tiles.dart';

class TilesMapper {
  static Tiles fromRandomApi(ApiTiles tiles) {
    return Tiles(tiles: tiles.tiles);
  }
}
