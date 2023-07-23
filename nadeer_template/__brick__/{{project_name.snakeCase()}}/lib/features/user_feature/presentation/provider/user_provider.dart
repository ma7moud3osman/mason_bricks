import 'dart:developer';
import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/dialog_functions.dart';
import '../../../../core/network/otp_request.dart';
import '../../domain/usecases/admin_get_all_users_use_case.dart';
import '../../domain/usecases/admin_update_user_use_case.dart';
import '../../domain/usecases/change_password_use_case.dart';
import '../../domain/usecases/forget_password_use_case.dart';
import '../../domain/usecases/get_my_profile_use_case.dart';

import '../../../../core/app/app.dart';
import '../../../../core/app/app_prefs.dart';
import '../../../../core/app/injection_container.dart';
import '../../../../core/network/change_password_request.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/admin_create_user_use_case.dart';
import '../../domain/usecases/update_my_profile_use_case.dart';
import '../../domain/usecases/update_password_use_case.dart';
import '../../domain/usecases/verify_otp_use_case.dart';

class UserProvider extends ChangeNotifier {
  final AdminCreateUserUseCase _adminCreateUserUseCase;

  final AdminGetAllUserUseCase _adminGetAllUsersUseCase;

  final AdminUpdateUserUseCase _adminUpdateUserUseCase;

  final ChangePasswordUseCase _changePasswordUseCase;

  final ForgetPasswordUseCase _forgetPasswordUseCase;

  final GetMyProfileUseCase _getMyProfileUseCase;

  final UpdateMyProfileUseCase _updateMyProfileUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  UserProvider({
    required AdminCreateUserUseCase adminCreateUserUseCase,
    required AdminGetAllUserUseCase adminGetAllUserUseCase,
    required AdminUpdateUserUseCase adminUpdateUserUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
    required ForgetPasswordUseCase forgetPasswordUseCase,
    required GetMyProfileUseCase getMyProfileUseCase,
    required UpdateMyProfileUseCase updateMyProfileUseCase,
    required UpdatePasswordUseCase updatePasswordUseCase,
    required VerifyOtpUseCase verifyOtpUseCase,
  })  : _adminCreateUserUseCase = adminCreateUserUseCase,
        _adminGetAllUsersUseCase = adminGetAllUserUseCase,
        _adminUpdateUserUseCase = adminUpdateUserUseCase,
        _changePasswordUseCase = changePasswordUseCase,
        _forgetPasswordUseCase = forgetPasswordUseCase,
        _getMyProfileUseCase = getMyProfileUseCase,
        _verifyOtpUseCase = verifyOtpUseCase,
        _updatePasswordUseCase = updatePasswordUseCase,
        _updateMyProfileUseCase = updateMyProfileUseCase;

  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isAuth => _currentUser != null;

  List<User> _allUsersList = [];

  List<User> get allUsersList => _allUsersList;

  final BuildContext _context = navContext;

  void showErrorMessage(String message) =>
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
          backgroundColor: Colors.redAccent,
        ),
      );

  void showSuccessMessage(String message) =>
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
          backgroundColor: Colors.green,
        ),
      );

  void setUser(
    User user, {
    bool isNeedToSaveLocal = true,
  }) {
    _currentUser = user;
    if (isNeedToSaveLocal) {
      instance<AppPreferences>().saveUserData(user);
    }
    notifyListeners();
  }

  showLoading() => showLoadingDialog();

  dismissLoading() => disMissCurrentLoadingDialog();

  Future<void> logOut() async {
    _currentUser = null;
    await instance<AppPreferences>().removeUser();
    if (_context.mounted) {
      Navigator.of(_context).pushNamedAndRemoveUntil(
        Routes.startScreenRoute,
        (route) => false,
      );
    }

    notifyListeners();
  }

  Future<void> getMyProfile({bool isShowLoading = true}) async {
    // if (isShowLoading) {
    //   showLoading();
    // }
    final result = await _getMyProfileUseCase(Void);
    result.fold((l) {
      showErrorMessage(l.message);
      _currentUser = null;
      notifyListeners();
      instance<AppPreferences>().removeUser();
    }, (user) {
      setUser(user);
      log('user => $user');
      notifyListeners();
    });
    // if (isShowLoading) {
    //   dismissLoading();
    // }
  }

  Future<void> verifyOtp(
      {required OtpRequest otpRequest, String? screenName}) async {
    showLoading();
    final response = await _verifyOtpUseCase(otpRequest);
    response.fold((failure) {
      dismissLoading();
      showErrorMessage(failure.message);
    }, (userItem) {
      dismissLoading();
      setUser(userItem, isNeedToSaveLocal: false);
      if (screenName != null) {
        Navigator.of(_context)
            .pushNamedAndRemoveUntil(screenName, (route) => false);
      }
    });
  }

  Future<void> updatePassword({required String password}) async {
    showLoading();
    final response = await _updatePasswordUseCase(password);
    response.fold((failure) {
      dismissLoading();
      showErrorMessage(failure.message);
    }, (userItem) {
      dismissLoading();
      setUser(userItem);
      pushToHomeScreen();
    });
  }

  void pushToHomeScreen() =>
      Navigator.of(_context).pushReplacementNamed(getScreenName());

  String getScreenName() {
    switch (_currentUser?.role) {
      case Roles.fulfillment:
        return Routes.fulfillmentNavigationBarScreen;
      case Roles.admin:
        return Routes.adminNavigationBarScreen;
      case Roles.driver:
        return Routes.deliveryNavigationBarScreen;
      default:
        return Routes.navigationBarRoute;
    }
  }

  Future<void> forgetPassword({required String email}) async {
    // showLoading();
    // await Future.delayed(Duration(seconds: 5));
    final result = await _forgetPasswordUseCase(email);

    result.fold(
      (l) {
        // dismissLoading();
        showErrorMessage(l.message);
      },
      (_) {
        // dismissLoading();
        showSuccessMessage(
          "check_your_email_for_otp".tr(),
        );
      },
    );
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    showLoading();
    final result = await _changePasswordUseCase(
      ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );
    result.fold(
      (l) {
        dismissLoading();
        showErrorMessage(l.message);
      },
      (user) {
        dismissLoading();
        showSuccessMessage("password_updated".tr());
        setUser(user);
        Navigator.of(_context).pop();
      },
    );
  }

  Future<void> adminUpdateUser(
    User user,
  ) async {
    showLoading();
    final result = await _adminUpdateUserUseCase(user);
    result.fold(
      (l) => showErrorMessage(l.message),
      (_) {},
    );
    dismissLoading();
  }

  Future<void> adminGetAllUsers(
    bool isActiveOnly,
  ) async {
    _allUsersList.clear();
    showLoading();
    final result = await _adminGetAllUsersUseCase(isActiveOnly);
    result.fold(
      (l) => showErrorMessage(l.message),
      (usersList) {
        _allUsersList = usersList;
        notifyListeners();
      },
    );
    dismissLoading();
  }

  Future<void> adminCreateUser(
    User user,
  ) async {
    _allUsersList.clear();
    showLoading();
    final result = await _adminCreateUserUseCase(user);
    result.fold(
      (l) => showErrorMessage(l.message),
      (_) {},
    );
    dismissLoading();
  }

  Future<void> updateCurrentUser({
    String? firstName,
    String? lastName,
    String? profileImageUri,
    String? email,
    // String? profileId,
    String? phone,
    String? birthDate,
    bool? active,
    Roles? role,
    String? token,
  }) async {
    if (_currentUser != null) {
      showLoading();
      final newUser = _currentUser!.copyWith(
        firstName: firstName,
        lastName: lastName,
        profileImageUri: profileImageUri,
        email: email,
        phone: phone,
        birthDate: birthDate,
        active: active,
        role: role,
        token: token,
      );
      final result = await _updateMyProfileUseCase(newUser);
      result.fold((l) => showErrorMessage(l.message), (_) {
        setUser(newUser);
        showSuccessMessage("user_updated".tr());
      });
      dismissLoading();
      Navigator.of(_context).pop();
    }
  }
}
