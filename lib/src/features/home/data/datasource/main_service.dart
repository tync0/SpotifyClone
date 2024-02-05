import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spotify/src/core/interceptor/token_interceptor.dart';
import 'package:spotify/src/utils/contants/api.dart';

import '../model/playlists_model.dart';

part 'main_service.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class MainService {
  factory MainService(Dio dio) {
    dio.options = BaseOptions(contentType: 'application/json');
    dio.interceptors.add(
      TokenInterceptor(),
    );
    return _MainService(dio);
  }
  @GET(ServiceConst.playlistEndPoint)
  Future<HttpResponse<PlaylistsModel>> getPlaylistInitial();
}
