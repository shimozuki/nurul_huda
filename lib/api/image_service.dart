import 'dart:convert';
import 'package:appmuslim/model/foto/image_model.dart';
import 'package:http/http.dart' as http;

class ImageService {
  final String apiUrl = 'http://nurulhuda.website/Api_masjid/api/image';

  Future<List<ImageModel>> getImages() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data'];

      List<ImageModel> images = [];
      for (var item in data) {
        final image = ImageModel.fromJson(item);
        images.add(image);
      }

      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
