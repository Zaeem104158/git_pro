class GithubReposResponseEntity {
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? pushedAt;
  final String? language;

  const GithubReposResponseEntity({
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.language,
  });
}
