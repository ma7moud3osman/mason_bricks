import 'package:dartz/dartz.dart';
import '../../../../core/network/signup_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class SignUpUseCase extends BaseUseCase<SignUpRequest, User> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(SignUpRequest input) async {
    return await authRepository.signUp(input);
  }
}
