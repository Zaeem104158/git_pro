import 'package:point_of_sale/src/features/home/domain/entity/github_repos_response_entity.dart';

class GithubReposResponseModel extends GithubReposResponseEntity {
  const GithubReposResponseModel({
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.pushedAt,
    super.language,
  });

  factory GithubReposResponseModel.fromJson(Map<String, dynamic> json) {
    return GithubReposResponseModel(
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime(json['updated_at']),
      pushedAt: json['pushed_at'],
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
    };
  }
}
