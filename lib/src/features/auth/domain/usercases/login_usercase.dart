import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:gitPro/src/core/error/failuer.dart';
import 'package:gitPro/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:gitPro/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:gitPro/src/features/auth/domain/repository/auth_repository.dart';
import 'package:gitPro/src/shared/usecase/usecase.dart';

@LazySingleton()
class Login
    implements
        UseCase<Either<Failure, LoginResponseEntity>, LoginRequestEntity> {
  final AuthRepository _authRepository;

  Login(this._authRepository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) {
    return _authRepository.login(params);
  }
}
