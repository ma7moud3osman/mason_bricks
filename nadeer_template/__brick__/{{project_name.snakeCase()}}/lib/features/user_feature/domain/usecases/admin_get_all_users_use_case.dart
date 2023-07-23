import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class AdminGetAllUserUseCase extends BaseUseCase<bool, List<User>> {
  final UserRepository userRepository;

  AdminGetAllUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, List<User>>> call(bool input) async {
    return await userRepository.adminGetAllUsers(input);
  }
}
