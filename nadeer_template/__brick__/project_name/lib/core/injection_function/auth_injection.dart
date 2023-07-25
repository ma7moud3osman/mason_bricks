import '../../features/auth_feature/data/datasources/auth_remote_data_source.dart';
import '../../features/auth_feature/data/repositories/auth_repository_impl.dart';
import '../../features/auth_feature/domain/repositories/auth_repository.dart';
import '../../features/auth_feature/domain/usecases/apple_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/email_and_password_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/google_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/signup_use_case.dart';
import '../../features/auth_feature/domain/usecases/twitter_login_use_case.dart';
import '../api/api_consumer.dart';
import '../app/injection_container.dart';
import '../network/network_info.dart';

void initAuthModule() {
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      apiConsumer: instance<ApiConsumer>(),
    ),
  );

  instance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: instance<AuthRemoteDataSource>(),
      networkInfo: instance<NetworkInfo>(),
    ),
  );
  instance.registerFactory<AppleLoginUseCase>(
    () => AppleLoginUseCase(
      authRepository: instance<AuthRepository>(),
    ),
  );

  instance.registerFactory<GoogleLoginUseCase>(
    () => GoogleLoginUseCase(
      authRepository: instance<AuthRepository>(),
    ),
  );

  instance.registerFactory<TwitterLoginUseCase>(
    () => TwitterLoginUseCase(
      authRepository: instance<AuthRepository>(),
    ),
  );

  instance.registerFactory<EmailLoginUseCase>(
    () => EmailLoginUseCase(
      authRepository: instance<AuthRepository>(),
    ),
  );

  instance.registerFactory<SignUpUseCase>(
    () => SignUpUseCase(
      authRepository: instance<AuthRepository>(),
    ),
  );

  // instance.registerFactory<AuthProvider>(
  //   () => AuthProvider(
  //     appleLoginUseCase: instance<AppleLoginUseCase>(),
  //     emailLoginUseCase: instance<EmailLoginUseCase>(),
  //     googleLoginUseCase: instance<GoogleLoginUseCase>(),
  //     twitterLoginUseCase: instance<TwitterLoginUseCase>(),
  //     signUpUseCase: instance<SignUpUseCase>(),
  //     userProvider: instance<UserProvider>(),
  //   ),
  // );
}
