import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

import '../../../../core/error/failures.dart';

class ForgetPasswordUseCase extends BaseUseCase<String, void> {
  final UserRepository userRepository;

  ForgetPasswordUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(String input) async {
    return await userRepository.forgetPassword(input);
  }
}
