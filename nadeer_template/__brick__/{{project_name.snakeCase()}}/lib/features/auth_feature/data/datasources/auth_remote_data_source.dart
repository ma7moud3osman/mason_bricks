import 'dart:io';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/network/email_login_request.dart';
import '../../../../core/network/signup_request.dart';
import '../../../../core/network/twitter_login_request.dart';
import '../../../user_feature/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> appleLogin(String token);

  Future<UserModel> googleLogin(String token);

  Future<UserModel> twitterLogin(TwitterLoginRequest twitterLoginRequest);

  Future<UserModel> emailLogin(EmailLoginRequest emailLoginRequest);

  Future<UserModel> signUp(SignUpRequest signUpRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  final authHeaders = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
    "platform": Platform.isAndroid ? 'android' : "ios",
  };

  @override
  Future<UserModel> appleLogin(String token) async {
    final Map<String, dynamic> body = {
      "token": token,
      "isIos": Platform.isIOS,
      "isAndroid": Platform.isAndroid
    };
    final response = await apiConsumer.post(
      EndPoints.appleAuthPath,
      body: body,
      headers: authHeaders,
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> emailLogin(EmailLoginRequest emailLoginRequest) async {
    final response = await apiConsumer.post(
      EndPoints.emailAuthPath,
      body: emailLoginRequest.toJson(),
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> googleLogin(String token) async {
    final Map<String, dynamic> body = {
      "accessToken": token,
      "isIos": Platform.isIOS,
      "isAndroid": Platform.isAndroid
    };
    final response = await apiConsumer.post(
      EndPoints.googleAuthPath,
      body: body,
      headers: authHeaders,
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> twitterLogin(
    TwitterLoginRequest twitterLoginRequest,
  ) async {
    final response = await apiConsumer.post(
      EndPoints.twitterAuthPath,
      body: twitterLoginRequest.toJson(),
      headers: authHeaders,
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> signUp(SignUpRequest signUpRequest) async {
    final response = await apiConsumer.post(
      EndPoints.signupPath,
      body: signUpRequest.toJson(),
    );
    return UserModel.fromJson(response);
  }
}
