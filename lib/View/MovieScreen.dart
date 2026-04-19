import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/MovieProvider.dart';
import '../Controller/MovieController.dart';
import '../Model/MovieModel.dart' as model;
import 'MovieDetailScreen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MovieController.getMovies(context.read<MovieProvider>());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('movies', style: TextStyle(color: Colors.white70)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white70),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white70),
          ),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.movies.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await MovieController.getMovies(provider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: provider.movies.length,
              itemBuilder: (context, index) {
                final movie = provider.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                  child: _buildMovieCard(movie),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieCard(model.MovieModel movie) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 16, 16),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Row(
              children: [
                // Image Section
                Hero(
                  tag: 'movie_${movie.id}',
                  child: movie.image.medium.isNotEmpty
                      ? Image.network(
                          movie.image.medium,
                          width: 135,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 135,
                          color: Colors.grey[850],
                          child: const Icon(Icons.movie, color: Colors.white24),
                        ),
                ),
                // Details Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.rating.average?.toString() ?? '8.0+',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              movie.premiered.year.toString(),
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.summary.replaceAll(RegExp(r'<[^>]*>'), ''),
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                            height: 1.4,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Wrap(
                          spacing: 6,
                          children: movie.genres.take(2).map((genre) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent.withOpacity(
                                  0.15,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.deepPurpleAccent.withOpacity(
                                    0.3,
                                  ),
                                ),
                              ),
                              child: Text(
                                _getGenreName(genre),
                                style: const TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Optional: Favorite icon overlay
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white.withOpacity(0.5),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getGenreName(model.Genre genre) {
    return genre.toString().split('.').last.replaceAll('_', ' ');
  }
}

