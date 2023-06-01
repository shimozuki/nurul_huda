import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/agenda/agenda_model.dart';

class ApiService {
  static const String apiUrl = 'http://nurulhuda.website/Api_masjid/api/agenda';

  static Future<List<Agenda>> getAgendaList() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];
      return data.map((item) => Agenda.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load agenda');
    }
  }
}
