// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i1022;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usercases/login_usercase.dart' as _i749;
import '../../features/auth/presentation/bloc/login_bloc.dart' as _i990;
import '../../features/home/data/datasource/remote/repos_remote_datasource.dart'
    as _i268;
import '../../features/home/data/repository/repos_repository_impl.dart'
    as _i474;
import '../../features/home/domain/repository/repos_repository.dart' as _i766;
import '../../features/home/domain/usecases/repos_fetch_usecase.dart' as _i1070;
import '../../features/home/presentation/bloc/repos_bloc.dart' as _i189;
import '../../features/profile/data/datasources/remote/profile_remote_datasource.dart'
    as _i750;
import '../../features/profile/data/repository/profile_repository_impl.dart'
    as _i309;
import '../../features/profile/domain/repository/profile_repository.dart'
    as _i364;
import '../../features/profile/domain/usecases/profile_fetch_usecase.dart'
    as _i880;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../route/app_page.dart' as _i900;
import '../service/cache_service.dart' as _i723;
import 'app_injection_module.dart' as _i975;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i361.Dio>(() => appModule.basicDio());
  gh.lazySingleton<_i583.GoRouter>(() => appModule.router);
  gh.lazySingleton<_i900.AppPage>(() => _i900.AppPage());
  gh.lazySingleton<_i1022.AuthRemoteDataSource>(
    () => _i1022.AuthRemoteDataSource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i750.ProfileRemoteDataSource>(
    () => _i750.ProfileRemoteDataSource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i268.ReposRemoteDataSource>(
    () => _i268.ReposRemoteDataSource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i723.ICacheService>(
    () => _i723.CacheService(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i364.ProfileRepository>(
    () => _i309.ProfileRepositoryImpl(gh<_i750.ProfileRemoteDataSource>()),
  );
  gh.lazySingleton<_i766.ReposRepository>(
    () => _i474.ReposRepositoryImpl(gh<_i268.ReposRemoteDataSource>()),
  );
  gh.lazySingleton<_i961.AuthRepository>(
    () => _i409.AuthRepositoryImpl(gh<_i1022.AuthRemoteDataSource>()),
  );
  gh.lazySingleton<_i880.ProfileFetch>(
    () => _i880.ProfileFetch(gh<_i364.ProfileRepository>()),
  );
  gh.factory<_i469.ProfileBloc>(
    () => _i469.ProfileBloc(gh<_i880.ProfileFetch>()),
  );
  gh.lazySingleton<_i1070.ReposFetch>(
    () => _i1070.ReposFetch(gh<_i766.ReposRepository>()),
  );
  gh.lazySingleton<_i749.Login>(() => _i749.Login(gh<_i961.AuthRepository>()));
  gh.factory<_i189.ReposBloc>(() => _i189.ReposBloc(gh<_i1070.ReposFetch>()));
  gh.factory<_i990.LoginBloc>(() => _i990.LoginBloc(gh<_i749.Login>()));
  return getIt;
}

class _$AppModule extends _i975.AppModule {}
