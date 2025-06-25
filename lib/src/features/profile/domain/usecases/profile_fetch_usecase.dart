import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/profile/domain/entity/profile_response_entity.dart';
import 'package:point_of_sale/src/features/profile/domain/repository/profile_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class ProfileFetch
    implements UseCase<Either<Failure, ProfileResponseEntity>, String> {
  final ProfileRepository _profileRepository;

  ProfileFetch(this._profileRepository);

  @override
  Future<Either<Failure, ProfileResponseEntity>> call(String params) {
    return _profileRepository.profileFetch(params);
  }
}
