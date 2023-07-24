import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/upload_image.dart';
import '../../domain/usecases/create_image_usecase.dart';

class UploadImageProvider extends ChangeNotifier {
  final CreateImageUseCase createImageUseCase;

  UploadImageProvider({required this.createImageUseCase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UploadImage? _imageItem;
  UploadImage? get imageItem => _imageItem;

  Future<void> createImage() async {
    _isLoading = true;
    notifyListeners();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final response = await createImageUseCase(File(image.path));
      response.fold(
        (failure) => log(failure.message),
        (imageObject) {
          _imageItem = imageObject;
        },
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
