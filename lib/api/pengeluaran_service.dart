import 'dart:convert';
import 'package:nurulhudautan/model/pengeluaran/pengeluaran_model.dart';
import 'package:http/http.dart' as http;

class PengeluaranService {
  final String apiUrl = 'http://nurulhuda.website/Api_masjid/api/pengeluaran';

  Future<List<Pengeluaran>> getPengeluaran() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final data = jsonResponse['data'] as List<dynamic>;

      return data.map((item) => Pengeluaran.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load pengeluaran');
    }
  }
}
