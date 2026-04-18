import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/MovieModel.dart';

class MovieService {
  static Future<List<MovieModel>> getMovies() async {
    final url = 'https://api.tvmaze.com/shows';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
