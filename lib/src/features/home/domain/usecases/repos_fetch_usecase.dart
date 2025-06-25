import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/home/domain/entity/github_repos_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/repository/repos_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class ReposFetch
    implements
        UseCase<Either<Failure, List<GithubReposResponseEntity>>, String> {
  final ReposRepository _reposRepository;

  ReposFetch(this._reposRepository);

  @override
  Future<Either<Failure, List<GithubReposResponseEntity>>> call(String params) {
    return _reposRepository.fetchUserRepos(params);
  }
}
