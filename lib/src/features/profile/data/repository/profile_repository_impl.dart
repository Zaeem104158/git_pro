import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:gitPro/src/core/error/failuer.dart';
import 'package:gitPro/src/features/profile/data/datasources/remote/profile_remote_datasource.dart';
import 'package:gitPro/src/features/profile/domain/entity/profile_response_entity.dart';
import 'package:gitPro/src/features/profile/domain/repository/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProfileResponseEntity>> profileFetch(
    String name,
  ) async {
    try {
      final response = await remoteDataSource.profile(name);
      if (response.response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(ServerFailure("Server Failure"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
