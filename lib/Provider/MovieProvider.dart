import 'package:flutter/material.dart';
import '../Model/MovieModel.dart';

class MovieProvider with ChangeNotifier {
  List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  void setMovies(List<MovieModel> movies) {
    _movies = movies;
    notifyListeners();
  }
}