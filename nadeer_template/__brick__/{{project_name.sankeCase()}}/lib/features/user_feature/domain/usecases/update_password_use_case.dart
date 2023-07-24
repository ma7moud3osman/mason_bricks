import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class UpdatePasswordUseCase extends BaseUseCase<String, User> {
  final UserRepository userRepository;

  UpdatePasswordUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(String input) async {
    return await userRepository.updatePassword(password: input);
  }
}
