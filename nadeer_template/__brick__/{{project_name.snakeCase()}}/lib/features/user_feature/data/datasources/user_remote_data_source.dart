import 'package:provider/provider.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app/app.dart';
import '../../../../core/network/change_password_request.dart';
import '../../../../core/network/otp_request.dart';
import '../../domain/entities/user.dart';
import '../../presentation/provider/user_provider.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> adminCreateUser(User user);

  Future<void> adminUpdateUser(User user);

  Future<List<UserModel>> adminGetAllUsers(bool isActiveOnly);

  Future<UserModel> getMyProfile();

  Future<UserModel> updateMyProfile(User user);

  Future<UserModel> changePassword(ChangePasswordRequest changePasswordRequest);

  Future<void> forgetPassword(String email);

  Future<UserModel> verifyOtp({required OtpRequest otpRequest});

  Future<UserModel> updatePassword({required String password});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<void> adminCreateUser(User user) async {
    await apiConsumer.post(
      EndPoints.userPath,
      body: user.toJson(),
    );
  }

  @override
  Future<List<UserModel>> adminGetAllUsers(bool isActiveOnly) async {
    final response = await apiConsumer.get(
      EndPoints.userPath,
      queryParameters: {
        "active": false,
      },
    );
    List<UserModel> usersList = [];
    response.forEach((element) {
      usersList.add(element);
    });
    return usersList;
  }

  @override
  Future<void> adminUpdateUser(
    User user,
  ) async {
    await apiConsumer.put(
      "${EndPoints.userPath}/${user.sId}",
      body: user.toJson(),
    );
  }

  @override
  Future<UserModel> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    final response = await apiConsumer.post(
      EndPoints.changePasswordPath,
      body: changePasswordRequest.toJson(),
    );
    return UserModel.fromProfile(
      response,
      token: Provider.of<UserProvider>(navContext, listen: false)
          .currentUser
          ?.token,
    );
  }

  @override
  Future<void> forgetPassword(String email) async {
    await apiConsumer.post(
      EndPoints.forgetPasswordPath,
      body: {
        "email": email,
      },
    );
  }

  @override
  Future<UserModel> verifyOtp({required OtpRequest otpRequest}) async {
    final response = await apiConsumer.post(
      EndPoints.verify,
      body: otpRequest.toJson(),
    );
    final UserModel userItem = UserModel.fromJson(response);
    return userItem;
  }

  @override
  Future<UserModel> getMyProfile() async {
    final result = await apiConsumer.get(
      EndPoints.getProfilePath,
    );
    return UserModel.fromProfile(
      result,
      token: Provider.of<UserProvider>(navContext, listen: false)
          .currentUser
          ?.token,
    );
  }

  @override
  Future<UserModel> updateMyProfile(User user) async {
    final response = await apiConsumer.put(
      EndPoints.userPath,
      body: user.toJson(),
    );
    return UserModel.fromProfile(
      response,
      token: Provider.of<UserProvider>(navContext, listen: false)
          .currentUser
          ?.token,
    );
  }

  @override
  Future<UserModel> updatePassword({required String password}) async {
    Map<String, dynamic> body = {'password': password};
    final response = await apiConsumer.put(
      EndPoints.userPath,
      body: body,
    );
    return UserModel.fromProfile(
      response,
      token: Provider.of<UserProvider>(navContext, listen: false)
          .currentUser
          ?.token,
    );
  }
}
