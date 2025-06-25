import 'package:fpdart/fpdart.dart';
import 'package:gitPro/src/core/error/failuer.dart';
import 'package:gitPro/src/features/home/domain/entity/github_repos_response_entity.dart';

abstract interface class ReposRepository {
  Future<Either<Failure, List<GithubReposResponseEntity>>> fetchUserRepos(
    String username,
  );
}
