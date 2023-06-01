class ImageModel {
  final String fileName;

  ImageModel({required this.fileName});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      fileName: json['file_name'],
    );
  }
}
