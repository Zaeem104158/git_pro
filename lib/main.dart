import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gitPro/app.dart';
import 'package:gitPro/src/core/di/injection.dart';
import 'package:gitPro/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:gitPro/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:gitPro/src/features/auth/domain/usercases/login_usercase.dart';
import 'package:gitPro/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:gitPro/src/features/home/presentation/bloc/repos_bloc.dart';
import 'package:gitPro/src/features/profile/presentation/bloc/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => getIt<LoginBloc>()),
        BlocProvider<ProfileBloc>(create: (_) => getIt<ProfileBloc>()),
        BlocProvider<ReposBloc>(create: (_) => getIt<ReposBloc>()),
      ],
      child: const App(), // or LoginPage()
    ),
  );
}
