import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:gitPro/src/features/profile/domain/usecases/profile_fetch_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileFetch profileFetch;

  ProfileBloc(this.profileFetch) : super(ProfileInitial()) {
    on<FetchProfile>(_onFetchProfile);
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await profileFetch(event.username);

    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (response) => emit(ProfileSuccess(response)),
    );
  }
}
