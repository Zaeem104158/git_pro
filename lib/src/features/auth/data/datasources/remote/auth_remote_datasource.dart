import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:gitPro/src/features/auth/data/model/login_request_model.dart';
import 'package:gitPro/src/features/auth/data/model/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_datasource.g.dart';

@LazySingleton()
@RestApi()
abstract interface class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/login')
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel loginRequestModel,
  );
}
