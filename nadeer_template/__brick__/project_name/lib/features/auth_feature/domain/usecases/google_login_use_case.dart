import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../repositories/auth_repository.dart';

class GoogleLoginUseCase extends BaseUseCase<String, User> {
  final AuthRepository authRepository;

  GoogleLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(String input) async {
    return await authRepository.googleLogin(input);
  }
}
