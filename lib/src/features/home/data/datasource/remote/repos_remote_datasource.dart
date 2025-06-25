import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/home/data/model/github_repos_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'repos_remote_datasource.g.dart';

@LazySingleton()
@RestApi()
abstract interface class ReposRemoteDataSource {
  @factoryMethod
  factory ReposRemoteDataSource(Dio dio) = _ReposRemoteDataSource;

  @GET('/users/{username}/repos')
  Future<HttpResponse<List<GithubReposResponseModel>>> userRepos(
    @Path('username') String username,
  );
}
