import 'dart:convert';
import 'package:bored/src/bored/models/bored.dart';
import 'package:http/http.dart' as http;

class BoredRepository {
  Future<Bored> getData() async {
    try {
      final response =
          await http.get(Uri.parse('http://www.boredapi.com/api/activity/'));

      if (response.statusCode == 200) {
        // return Bored.fromJson(
        //   jsonDecode(response.body) as Map<String, dynamic>,
        // );
        final data = jsonDecode(response.body) as Map;
        final bored = Bored.fromJson(data as Map<String, dynamic>);
        return bored;
      } else {
        throw Exception('Server ERROR');
      }
    } catch (e) {
      rethrow;
    }
  }
}
