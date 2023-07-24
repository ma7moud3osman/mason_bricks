import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/upload_image.dart';
import '../repositories/upload_image_repository.dart';

class CreateImageUseCase extends BaseUseCase<File, UploadImage> {
  final ImageRepository imageRepository;
  CreateImageUseCase({required this.imageRepository});
  @override
  Future<Either<Failure, UploadImage>> call(File input) {
    return imageRepository.createImage(image: input);
  }
}
