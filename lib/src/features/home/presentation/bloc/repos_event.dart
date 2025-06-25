import 'package:equatable/equatable.dart';

abstract class ReposEvent extends Equatable {
  const ReposEvent();
  @override
  List<Object?> get props => [];
}

class FetchRepos extends ReposEvent {
  final String username;

  FetchRepos(this.username);

  @override
  List<Object?> get props => [username];
}
