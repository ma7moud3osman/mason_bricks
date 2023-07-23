import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/upload_image.dart';
import '../../domain/repositories/upload_image_repository.dart';
import '../data_sources/upload_image_remote_date_source.dart';

class ImageRepositoryImpl extends ImageRepository {
  final ImageRemoteDateSource imageRemoteDateSource;
  final NetworkInfo networkInfo;

  ImageRepositoryImpl({
    required this.imageRemoteDateSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UploadImage>> createImage(
      {required File image}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await imageRemoteDateSource.createImage(image: image);

        return Right(response);
      } catch (error, stack) {
        log('error   $error');
        log('stack   $stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
