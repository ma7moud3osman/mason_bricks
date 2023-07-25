import 'package:dartz/dartz.dart';
import '../../../../core/network/email_login_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class EmailLoginUseCase extends BaseUseCase<EmailLoginRequest, User> {
  final AuthRepository authRepository;

  EmailLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(EmailLoginRequest input) async {
    return await authRepository.emailLogin(input);
  }
}
