import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> userLogin(
    String username,
    String password,
  );
  Future<DataState<UserEntity>> userRegister(
    String username,
    String password,
    String firstName,
    String email,
  );
}
