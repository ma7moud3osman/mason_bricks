import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../user_feature/domain/entities/user.dart';

import '../../../../core/network/email_login_request.dart';
import '../../../../core/network/signup_request.dart';
import '../../../../core/network/twitter_login_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> appleLogin(String token);

  Future<Either<Failure, User>> googleLogin(String token);

  Future<Either<Failure, User>> twitterLogin(
      TwitterLoginRequest twitterLoginRequest);

  Future<Either<Failure, User>> emailLogin(EmailLoginRequest emailLoginRequest);

  Future<Either<Failure, User>> signUp(SignUpRequest signUpRequest);
}
