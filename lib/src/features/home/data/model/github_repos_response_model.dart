import 'package:gitPro/src/features/home/domain/entity/github_repos_response_entity.dart';

class GithubReposResponseModel extends GithubReposResponseEntity {
  const GithubReposResponseModel({
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.pushedAt,
    super.language,
    super.gitRepoUrl,
  });

  factory GithubReposResponseModel.fromJson(Map<String, dynamic> json) {
    return GithubReposResponseModel(
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
      pushedAt: json['pushed_at'] == null
          ? null
          : DateTime.parse(json['pushed_at']),
      gitRepoUrl: json['git_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pushed_at': pushedAt,
      'language': language,
      'git_url': gitRepoUrl,
    };
  }
}
