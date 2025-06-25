import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/home/domain/usecases/repos_fetch_usecase.dart';
import 'repos_event.dart';
import 'repos_state.dart';

@injectable
class ReposBloc extends Bloc<ReposEvent, ReposState> {
  final ReposFetch reposFetch;

  ReposBloc(this.reposFetch) : super(ReposInitial()) {
    on<FetchRepos>(_onFetchRepos);
  }

  Future<void> _onFetchRepos(FetchRepos event, Emitter<ReposState> emit) async {
    emit(ReposLoading());

    final result = await reposFetch(event.username);

    result.fold(
      (failure) => emit(ReposFailure(failure.message)),
      (response) => emit(ReposSuccess(response)),
    );
  }
}
