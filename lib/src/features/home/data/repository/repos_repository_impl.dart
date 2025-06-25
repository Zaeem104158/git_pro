import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/home/data/datasource/remote/repos_remote_datasource.dart';
import 'package:point_of_sale/src/features/home/domain/entity/github_repos_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/repository/repos_repository.dart';

@LazySingleton(as: ReposRepository)
class ReposRepositoryImpl implements ReposRepository {
  ReposRemoteDataSource remoteDataSource;
  ReposRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<GithubReposResponseEntity>>> fetchUserRepos(
    String username,
  ) async {
    try {
      final response = await remoteDataSource.userRepos(username);
      if (response.response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(ServerFailure("Server Failure"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
