import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/otp_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class VerifyOtpUseCase extends BaseUseCase<OtpRequest, User> {
  final UserRepository userRepository;

  VerifyOtpUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(OtpRequest input) async {
    return await userRepository.verifyOtp(otpRequest: input);
  }
}
