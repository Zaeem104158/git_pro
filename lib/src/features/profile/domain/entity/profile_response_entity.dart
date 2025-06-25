class ProfileResponseEntity {
  final String? login;
  final String? avatarUrl;
  final String? name;
  final int? publicRepos;
  final int? followers;
  final int? following;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProfileResponseEntity({
    this.login,
    this.avatarUrl,
    this.name,
    this.publicRepos,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });
}
