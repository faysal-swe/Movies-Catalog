class PeopleModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PeopleModel({this.page, this.results, this.totalPages, this.totalResults});

  PeopleModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;

  Results(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.knownFor});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(new KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? title;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? originalName;
  String? name;
  String? firstAirDate;
  List<String>? originCountry;

  KnownFor(
      {this.backdropPath,
        this.id,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.adult,
        this.title,
        this.originalLanguage,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.originalName,
        this.name,
        this.firstAirDate,
        this.originCountry});

  KnownFor.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    title = json['title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originalName = json['original_name'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
    originCountry = (json['origin_country']??[""]).cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['adult'] = this.adult;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
