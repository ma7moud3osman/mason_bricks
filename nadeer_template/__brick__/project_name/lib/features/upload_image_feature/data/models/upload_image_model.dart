import '../../domain/entities/upload_image.dart';

class UploadImageModel extends UploadImage {
  UploadImageModel({
    required super.sId,
    required super.url,
  });
  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      sId: json['id'],
      url: json['url'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = sId;
    data['url'] = url;

    return data;
  }
}
