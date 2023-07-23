import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/email_login_request.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/signup_request.dart';
import '../../../../core/network/twitter_login_request.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> appleLogin(String token) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.appleLogin(token);

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> emailLogin(
      EmailLoginRequest emailLoginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.emailLogin(
          emailLoginRequest,
        );

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> googleLogin(String token) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.googleLogin(token);

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> twitterLogin(
      TwitterLoginRequest twitterLoginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authRemoteDataSource.twitterLogin(twitterLoginRequest);

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUp(SignUpRequest signUpRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.signUp(signUpRequest);

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }
}
