import 'package:json_annotation/json_annotation.dart';

import 'video.dart';

part 'fast_laugh_resp.g.dart';

@JsonSerializable()
class FastLaughResp {
  int? page;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'total_results')
  int? totalResults;
  String? url;
  List<VideoResultData> videos;

  FastLaughResp({
    this.page,
    this.perPage,
    this.totalResults,
    this.url,
    this.videos = const [],
  });

  factory FastLaughResp.fromJson(Map<String, dynamic> json) {
    return _$FastLaughRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FastLaughRespToJson(this);
}
