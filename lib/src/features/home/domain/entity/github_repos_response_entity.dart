class GithubReposResponseEntity {
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final String? language;
  final String? gitRepoUrl;

  const GithubReposResponseEntity({
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.language,
    this.gitRepoUrl,
  });
}
