import 'package:equatable/equatable.dart';
import 'package:gitPro/src/features/home/domain/entity/github_repos_response_entity.dart';

abstract class ReposState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReposInitial extends ReposState {}

class ReposLoading extends ReposState {}

class ReposSuccess extends ReposState {
  final List<GithubReposResponseEntity> githubReposResponseEntityList;

  ReposSuccess(this.githubReposResponseEntityList);

  @override
  List<Object?> get props => [...githubReposResponseEntityList];
}

class ReposFailure extends ReposState {
  final String message;

  ReposFailure(this.message);

  @override
  List<Object?> get props => [message];
}
