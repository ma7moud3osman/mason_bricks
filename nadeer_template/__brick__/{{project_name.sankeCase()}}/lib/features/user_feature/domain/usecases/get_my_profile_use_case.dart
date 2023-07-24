import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class GetMyProfileUseCase extends BaseUseCase<void, User> {
  final UserRepository userRepository;

  GetMyProfileUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(void input) async {
    return await userRepository.getMyProfile();
  }
}
