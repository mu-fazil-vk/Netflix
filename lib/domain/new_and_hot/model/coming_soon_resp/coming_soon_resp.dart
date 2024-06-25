import 'package:json_annotation/json_annotation.dart';

part 'coming_soon_resp.g.dart';

@JsonSerializable()
class ComingSoonResp {
  ComingSoonDates? dates;
  int? page;
  List<ComingSoonResult> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  ComingSoonResp({
    this.dates,
    this.page,
    this.results = const [],
    this.totalPages,
    this.totalResults,
  });

  factory ComingSoonResp.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonRespToJson(this);
}



//dates
@JsonSerializable()
class ComingSoonDates {
  String? maximum;
  String? minimum;

  ComingSoonDates({this.maximum, this.minimum});

  factory ComingSoonDates.fromJson(Map<String, dynamic> json) => _$ComingSoonDatesFromJson(json);

  Map<String, dynamic> toJson() => _$ComingSoonDatesToJson(this);
}



//result

@JsonSerializable()
class ComingSoonResult {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  ComingSoonResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory ComingSoonResult.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonResultToJson(this);
}
