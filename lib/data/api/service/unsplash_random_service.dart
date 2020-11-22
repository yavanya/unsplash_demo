import 'package:dio/dio.dart';
import 'package:unsplash_demo/data/api/model/api_tiles.dart';

class UnsplashRandomService {
  /* TODO так делать нельзя, самому не нравится,
  прошу строго не судить за этот класс, и просто не успел 
  добавить человеческую обработку ошибок
  */
  String _randomUrl = 'https://api.unsplash.com/photos/random?count=';

  Map<String, dynamic> _headers = {
    'Authorization': 'Client-ID hPIAEgswUVrjzlQKOhE2H9NJ7XRPnfruyziqqwtdE_M',
    'Accept-Version': 'v1'
  };
  final Dio _dio = Dio();

  Future<ApiTiles> getRandomTiles(int count) async {
    _randomUrl = '$_randomUrl$count';
    var _response;
    // _response =
    //       await _dio.get(_randomUrl, options: Options(headers: _headers));
    try {
      _response =
          await _dio.get(_randomUrl, options: Options(headers: _headers));
    } catch (e) {
      print('UnsplashRandomService RESPONCE ERROR $e');
    }

    List<dynamic> _raw = _response.data;
    return ApiTiles.fromRandomApi(_raw);
  }
}
