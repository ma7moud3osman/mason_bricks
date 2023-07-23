import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

class UpdateMyProfileUseCase extends BaseUseCase<User, User> {
  final UserRepository userRepository;

  UpdateMyProfileUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(User input) async {
    return await userRepository.updateMyProfile(input);
  }
}
