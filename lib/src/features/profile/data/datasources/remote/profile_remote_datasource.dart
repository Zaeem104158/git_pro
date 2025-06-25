import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:gitPro/src/features/profile/data/model/profile_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_remote_datasource.g.dart';

@LazySingleton()
@RestApi()
abstract interface class ProfileRemoteDataSource {
  @factoryMethod
  factory ProfileRemoteDataSource(Dio dio) = _ProfileRemoteDataSource;

  @GET('/users/{username}')
  Future<HttpResponse<ProfileResponseModel>> profile(
    @Path('username') String username,
  );
}
