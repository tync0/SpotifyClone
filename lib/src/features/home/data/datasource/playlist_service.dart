import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spotify/src/features/home/data/model/playlist_model.dart';
import 'package:spotify/src/utils/contants/api.dart';

part 'playlist_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PlaylistService {
  factory PlaylistService(Dio dio) {
    return _PlaylistService(dio);
  }
  @GET(playlistEndPoint)
  Future<HttpResponse<List<PlaylistModel>>> getPlaylistInitial();
}
