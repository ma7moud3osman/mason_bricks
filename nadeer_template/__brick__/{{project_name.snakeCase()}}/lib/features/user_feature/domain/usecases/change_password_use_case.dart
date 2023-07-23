import 'package:dartz/dartz.dart';
import '../../../../core/network/change_password_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class ChangePasswordUseCase extends BaseUseCase<ChangePasswordRequest, User> {
  final UserRepository userRepository;

  ChangePasswordUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(ChangePasswordRequest input) async {
    return await userRepository.changePassword(input);
  }
}
