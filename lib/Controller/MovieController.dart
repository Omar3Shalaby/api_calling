import '../Provider/MovieProvider.dart';
import '../Service/MovieService.dart';

class MovieController {
  static Future<void> getMovies(MovieProvider provider) async {
    final movies = await MovieService.getMovies();
    provider.setMovies(movies);
  }
}
