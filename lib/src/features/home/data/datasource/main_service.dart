import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spotify/src/utils/contants/api.dart';

part 'main_service.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class MainService {
  factory MainService(Dio dio) {
    dio.options = BaseOptions(contentType: 'application/json');
    return _MainService(dio);
  }
  @GET(ServiceConst.playlistEndPoint)
  Future<HttpResponse> getPlaylist();

  @GET("${ServiceConst.playlistEndPoint}/{id}/")
  Future<HttpResponse> getMusics(
    @Path("id") int id,
  );
}
