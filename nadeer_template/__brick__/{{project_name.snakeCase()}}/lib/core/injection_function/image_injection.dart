import '../../features/upload_image_feature/data/data_sources/upload_image_remote_date_source.dart';
import '../../features/upload_image_feature/data/repositories/upload_image_repository_impl.dart';
import '../../features/upload_image_feature/domain/repositories/upload_image_repository.dart';
import '../../features/upload_image_feature/domain/usecases/create_image_usecase.dart';
import '../../features/upload_image_feature/presentation/providers/upload_image_provider.dart';
import '../api/api_consumer.dart';
import '../app/injection_container.dart';
import '../network/network_info.dart';

void initImageModule() {
  instance.registerLazySingleton<ImageRemoteDateSource>(
    () => ImageRemoteDateSourceImpl(apiConsumer: instance<ApiConsumer>()),
  );

  instance.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(
      imageRemoteDateSource: instance<ImageRemoteDateSource>(),
      networkInfo: instance<NetworkInfo>(),
    ),
  );

  instance.registerFactory<CreateImageUseCase>(
    () => CreateImageUseCase(
      imageRepository: instance<ImageRepository>(),
    ),
  );

  instance.registerFactory<UploadImageProvider>(
    () => UploadImageProvider(
      createImageUseCase: instance<CreateImageUseCase>(),
    ),
  );
}
