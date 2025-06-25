import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class FetchProfile extends ProfileEvent {
  final String username;

  FetchProfile(this.username);

  @override
  List<Object?> get props => [username];
}
