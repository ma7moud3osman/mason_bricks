import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/change_password_request.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/otp_request.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> adminCreateUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userRemoteDataSource.adminCreateUser(user);

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
  Future<Either<Failure, List<User>>> adminGetAllUsers(
      bool isActiveOnly) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await userRemoteDataSource.adminGetAllUsers(isActiveOnly);

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
  Future<Either<Failure, void>> adminUpdateUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userRemoteDataSource.adminUpdateUser(user);

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
  Future<Either<Failure, User>> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await userRemoteDataSource.changePassword(changePasswordRequest);

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
  Future<Either<Failure, void>> forgetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userRemoteDataSource.forgetPassword(email);

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
  Future<Either<Failure, User>> getMyProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userRemoteDataSource.getMyProfile();
        log('getMyProfile => $response');

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
  Future<Either<Failure, User>> updateMyProfile(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userRemoteDataSource.updateMyProfile(user);

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
  Future<Either<Failure, User>> verifyOtp(
      {required OtpRequest otpRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await userRemoteDataSource.verifyOtp(otpRequest: otpRequest);

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
  Future<Either<Failure, User>> updatePassword(
      {required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await userRemoteDataSource.updatePassword(password: password);
        print(response);

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
