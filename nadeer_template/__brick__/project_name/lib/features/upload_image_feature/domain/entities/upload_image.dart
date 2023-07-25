abstract class UploadImage {
  late final String sId;
  late final String url;

  UploadImage({
    required this.sId,
    required this.url,
  });
  Map<String, dynamic> toJson();
}
