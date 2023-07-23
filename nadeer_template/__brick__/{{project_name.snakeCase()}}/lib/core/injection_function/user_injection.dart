import '../../features/user_feature/data/datasources/user_remote_data_source.dart';
import '../../features/user_feature/data/repositories/user_repository_impl.dart';
import '../../features/user_feature/domain/repositories/user_repository.dart';
import '../../features/user_feature/domain/usecases/admin_create_user_use_case.dart';
import '../../features/user_feature/domain/usecases/admin_get_all_users_use_case.dart';
import '../../features/user_feature/domain/usecases/admin_update_user_use_case.dart';
import '../../features/user_feature/domain/usecases/change_password_use_case.dart';
import '../../features/user_feature/domain/usecases/forget_password_use_case.dart';
import '../../features/user_feature/domain/usecases/get_my_profile_use_case.dart';
import '../../features/user_feature/domain/usecases/update_my_profile_use_case.dart';
import '../../features/user_feature/domain/usecases/update_password_use_case.dart';
import '../../features/user_feature/domain/usecases/verify_otp_use_case.dart';
import '../../features/user_feature/presentation/provider/user_provider.dart';
import '../api/api_consumer.dart';
import '../app/injection_container.dart';
import '../network/network_info.dart';

void initUserModule() {
  instance.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      apiConsumer: instance<ApiConsumer>(),
    ),
  );

  instance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: instance<UserRemoteDataSource>(),
      networkInfo: instance<NetworkInfo>(),
    ),
  );
  instance.registerFactory<AdminCreateUserUseCase>(
    () => AdminCreateUserUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );

  instance.registerFactory<AdminGetAllUserUseCase>(
    () => AdminGetAllUserUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );

  instance.registerFactory<AdminUpdateUserUseCase>(
    () => AdminUpdateUserUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );

  instance.registerFactory<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );

  instance.registerFactory<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );
  instance.registerFactory<GetMyProfileUseCase>(
    () => GetMyProfileUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );
  instance.registerFactory<UpdateMyProfileUseCase>(
    () => UpdateMyProfileUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );
  instance.registerFactory<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );
  instance.registerFactory<UpdatePasswordUseCase>(
    () => UpdatePasswordUseCase(
      userRepository: instance<UserRepository>(),
    ),
  );

  instance.registerFactory<UserProvider>(
    () => UserProvider(
      adminCreateUserUseCase: instance<AdminCreateUserUseCase>(),
      adminGetAllUserUseCase: instance<AdminGetAllUserUseCase>(),
      adminUpdateUserUseCase: instance<AdminUpdateUserUseCase>(),
      changePasswordUseCase: instance<ChangePasswordUseCase>(),
      forgetPasswordUseCase: instance<ForgetPasswordUseCase>(),
      getMyProfileUseCase: instance<GetMyProfileUseCase>(),
      updateMyProfileUseCase: instance<UpdateMyProfileUseCase>(),
      verifyOtpUseCase: instance<VerifyOtpUseCase>(),
      updatePasswordUseCase: instance<UpdatePasswordUseCase>(),
    ),
  );
}
