import 'dart:convert';

TopShows tvShowFromJson(String str) => TopShows.fromJson(json.decode(str));

String tvShowToJson(TopShows data) => json.encode(data.toJson());

class TopShows {
  TopShows({
    this.page,
    this.topShows,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<TvShow> topShows;
  int totalPages;
  int totalResults;

  factory TopShows.fromJson(Map<String, dynamic> json) => TopShows(
        page: json["page"],
        topShows:
            List<TvShow>.from(json["results"].map((x) => TvShow.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(topShows.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TvShow {
  TvShow({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<OriginCountry> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate:
            DateTime.tryParse(json["first_air_date"]) ?? DateTime.now(),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<OriginCountry>.from(
            json["origin_country"].map((x) => originCountryValues.map[x])),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(
            originCountry.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginCountry { GB, JP, KR, CN }

final originCountryValues = EnumValues({
  "CN": OriginCountry.CN,
  "GB": OriginCountry.GB,
  "JP": OriginCountry.JP,
  "KR": OriginCountry.KR
});

enum OriginalLanguage { EN, JA, KO, ZH }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO,
  "zh": OriginalLanguage.ZH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
