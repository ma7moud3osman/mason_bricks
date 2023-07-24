import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';
import '../models/upload_image_model.dart';

abstract class ImageRemoteDateSource {
  Future<UploadImageModel> createImage({required File image});
}

class ImageRemoteDateSourceImpl extends ImageRemoteDateSource {
  final ApiConsumer apiConsumer;

  ImageRemoteDateSourceImpl({required this.apiConsumer});

  @override
  Future<UploadImageModel> createImage({required File image}) async {
    final response = await apiConsumer.post(
      EndPoints.imagePath,
      body: {
        "image": MultipartFile.fromFileSync(
          image.path,
          contentType: MediaType.parse("image/jpeg"),
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      },
      formDataIsEnabled: true,
    );
    final UploadImageModel imageItem = UploadImageModel.fromJson(response);
    return imageItem;
  }
}
