import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../core/app/app.dart';
import '../../../../core/network/email_login_request.dart';
import '../../../../core/network/signup_request.dart';
import '../../../../core/network/twitter_login_request.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/constants.dart';
import '../../../user_feature/presentation/provider/user_provider.dart';
import '../../domain/usecases/apple_login_use_case.dart';
import '../../domain/usecases/email_and_password_login_use_case.dart';
import '../../domain/usecases/google_login_use_case.dart';
import '../../domain/usecases/signup_use_case.dart';
import '../../domain/usecases/twitter_login_use_case.dart';

class AuthProvider extends ChangeNotifier {
  final AppleLoginUseCase _appleLoginUseCase;
  final EmailLoginUseCase _emailLoginUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final TwitterLoginUseCase _twitterLoginUseCase;
  final SignUpUseCase _signUpUseCase;
  final UserProvider _userProvider;

  AuthProvider({
    required AppleLoginUseCase appleLoginUseCase,
    required EmailLoginUseCase emailLoginUseCase,
    required GoogleLoginUseCase googleLoginUseCase,
    required TwitterLoginUseCase twitterLoginUseCase,
    required SignUpUseCase signUpUseCase,
    required UserProvider userProvider,
  })  : _appleLoginUseCase = appleLoginUseCase,
        _emailLoginUseCase = emailLoginUseCase,
        _googleLoginUseCase = googleLoginUseCase,
        _twitterLoginUseCase = twitterLoginUseCase,
        _signUpUseCase = signUpUseCase,
        _userProvider = userProvider;

  final BuildContext context = navContext;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void pushToHomeScreen() => Navigator.of(context).pushNamedAndRemoveUntil(
        getScreenName(),
        (route) => false,
      );

  String getScreenName() {
    switch (_userProvider.currentUser?.role) {
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

  void showErrorMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
          backgroundColor: Colors.redAccent,
        ),
      );

  Future<void> appleLogin() async {
    _isLoading = true;
    notifyListeners();
    final AuthorizationCredentialAppleID credential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (credential.identityToken != null) {
      final response = await _appleLoginUseCase(credential.identityToken!);
      response.fold(
        (error) => showErrorMessage(error.message),
        _userProvider.setUser,
      );
    }
    _isLoading = false;
    notifyListeners();
    if (_userProvider.currentUser != null) {
      pushToHomeScreen();
    }
  }

  Future<void> googleLogin() async {
    _isLoading = true;
    notifyListeners();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth?.accessToken != null) {
      final response = await _googleLoginUseCase(
        googleAuth!.accessToken!,
      );
      response.fold(
        (error) => showErrorMessage(error.message),
        _userProvider.setUser,
      );
    }
    _isLoading = false;
    notifyListeners();
    if (_userProvider.currentUser != null) {
      pushToHomeScreen();
    }
  }

  Future<void> twitterLogin() async {
    _isLoading = true;
    notifyListeners();
    try {
      final twitterLogin = TwitterLogin(
        apiKey: Constants.twitterApiKey,
        apiSecretKey: Constants.twitterApiSecretKey,
        redirectURI: Constants.twitterRedirectURI,
      );
      final authResult = await twitterLogin.loginV2();
      switch (authResult.status) {
        case TwitterLoginStatus.loggedIn:
          final TwitterLoginRequest twitterLoginRequest = TwitterLoginRequest(
            authToken: authResult.authToken!,
            authTokenSecret: authResult.authTokenSecret!,
          );
          final response = await _twitterLoginUseCase(twitterLoginRequest);
          response.fold(
            (error) => showErrorMessage(error.message),
            _userProvider.setUser,
          );
          break;
        case TwitterLoginStatus.cancelledByUser:
          log("cancelledByUser");
          showErrorMessage("login_cancelled".tr());
          break;
        case TwitterLoginStatus.error:
          showErrorMessage(
            authResult.errorMessage ?? "",
          );
          break;

        default:
      }
    } on PlatformException {
      showErrorMessage("platform_exception".tr());
    } catch (error) {
      showErrorMessage(error.toString());
    }

    _isLoading = false;
    notifyListeners();
    if (_userProvider.currentUser != null) {
      pushToHomeScreen();
    }
  }

  Future<void> emailLogin(
    String email,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();
    final emailLoginRequest = EmailLoginRequest(
      email: email,
      password: password,
    );
    final response = await _emailLoginUseCase(emailLoginRequest);
    response.fold(
      (error) => showErrorMessage(error.message),
      _userProvider.setUser,
    );
    switch (_userProvider.currentUser?.role) {
      case Roles.fulfillment:
        break;
      case Roles.admin:
        break;
      case Roles.driver:
        break;
      case Roles.user:
        break;
      default:
        break;
    }
    _isLoading = false;
    notifyListeners();
    if (_userProvider.currentUser != null) {
      pushToHomeScreen();
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    required String email,
  }) async {
    _isLoading = true;
    notifyListeners();
    final signUpRequest = SignUpRequest(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
    final response = await _signUpUseCase(signUpRequest);
    response.fold(
      (error) => showErrorMessage(error.message),
      _userProvider.setUser,
    );
    _isLoading = false;
    notifyListeners();
    if (_userProvider.currentUser != null) {
      pushToHomeScreen();
    }
  }
}
