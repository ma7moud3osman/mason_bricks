import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/change_password_request.dart';
import '../../../../core/network/otp_request.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> adminCreateUser(User user);

  Future<Either<Failure, void>> adminUpdateUser(User user);

  Future<Either<Failure, List<User>>> adminGetAllUsers(bool isActiveOnly);

  Future<Either<Failure, User>> getMyProfile();

  Future<Either<Failure, User>> updateMyProfile(User user);

  Future<Either<Failure, User>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );

  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, User>> verifyOtp({required OtpRequest otpRequest});
  Future<Either<Failure, User>> updatePassword({required String password});
}
