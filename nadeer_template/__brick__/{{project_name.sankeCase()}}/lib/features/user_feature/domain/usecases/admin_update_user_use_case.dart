import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class AdminUpdateUserUseCase extends BaseUseCase<User, void> {
  final UserRepository userRepository;

  AdminUpdateUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(User input) async {
    return await userRepository.adminUpdateUser(input);
  }
}
