import 'package:github_flutter_app/data/network/util/base_response.dart';
import 'package:github_flutter_app/data/repository/base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  Future<ApiResponse> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return ApiResponse(true);

    // await apiClient.login({'email' : email, 'password': password});
  }
}
