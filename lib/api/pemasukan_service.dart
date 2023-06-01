import 'dart:convert';
import 'package:appmuslim/model/pemasukan/pemasukan_model.dart';
import 'package:http/http.dart' as http;

class PemasukanService {
  Future<List<PemasukanModel>> getPemasukanData() async {
    final url = 'http://nurulhuda.website/Api_masjid/api/pemasukan';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        List<PemasukanModel> pemasukanList = [];
        for (var item in jsonData['data']) {
          PemasukanModel pemasukan = PemasukanModel.fromJson(item);
          pemasukanList.add(pemasukan);
        }
        print(pemasukanList);
        return pemasukanList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
