import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/upload_image.dart';

abstract class ImageRepository {
  Future<Either<Failure, UploadImage>> createImage({required File image});
}
