import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/twitter_login_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../repositories/auth_repository.dart';

class TwitterLoginUseCase extends BaseUseCase<TwitterLoginRequest, User> {
  final AuthRepository authRepository;

  TwitterLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(TwitterLoginRequest input) async {
    return await authRepository.twitterLogin(input);
  }
}
