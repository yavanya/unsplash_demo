import 'package:unsplash_demo/data/api/api_utils.dart';
import 'package:unsplash_demo/data/api/service/unsplash_random_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;
  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(UnsplashRandomService());
    }
    return _apiUtil;
  }
}
