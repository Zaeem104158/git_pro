import 'package:fpdart/fpdart.dart';
import 'package:gitPro/src/core/error/failuer.dart';
import 'package:gitPro/src/features/profile/domain/entity/profile_response_entity.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, ProfileResponseEntity>> profileFetch(String name);
}
