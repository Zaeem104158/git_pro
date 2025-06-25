import 'package:point_of_sale/src/features/profile/domain/entity/profile_response_entity.dart';

class ProfileResponseModel extends ProfileResponseEntity {
  const ProfileResponseModel({
    super.login,
    super.name,
    super.avatarUrl,
    super.publicRepos,
    super.followers,
    super.following,
    super.createdAt,
    super.updatedAt,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      name: json['name'],
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,

      'avatar_url': avatarUrl,

      'name': name,

      'public_repos': publicRepos,

      'followers': followers,
      'following': following,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
