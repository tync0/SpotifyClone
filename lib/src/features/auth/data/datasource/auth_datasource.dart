import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spotify/src/features/auth/data/model/user_model.dart';
import 'package:spotify/src/utils/contants/api.dart';

part 'auth_datasource.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class AuthDatasource {
  factory AuthDatasource(Dio dio) {
    dio.options = BaseOptions();
    return _AuthDatasource(dio);
  }

  @POST(ServiceConst.loginEndPoint)
  Future<HttpResponse<UserModel>> userLogin(@Body() Map<String, dynamic> body);

  @POST(ServiceConst.registerEndPoint)
  Future<HttpResponse<UserModel>> userRegister(
      @Body() Map<String, dynamic> body);
}
