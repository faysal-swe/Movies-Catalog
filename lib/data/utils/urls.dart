class Urls{
  Urls._();
  static const String _baseUrl='https://api.themoviedb.org/3';
  static const String _key='api_key=cd890f94a756b1518a2a17617a5b430e';
  static const String movies ='$_baseUrl/discover/movie?$_key';
  static const String tvSeries = '$_baseUrl/discover/tv?$_key';
  static const String peopleList= '$_baseUrl/person/popular?$_key';
  static String movieDetails(String id) => '$_baseUrl/movie/$id?$_key';
  static String tvSeriesDetails(String id) => '$_baseUrl/tv/$id?$_key';
  static String search(String keyword) => '$_baseUrl/search/multi?query=$keyword&$_key';
  static String baseImageUrl(String posterPath) => 'https://image.tmdb.org/t/p/w500$posterPath';

}