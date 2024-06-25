// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_laugh_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastLaughResp _$FastLaughRespFromJson(Map<String, dynamic> json) =>
    FastLaughResp(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      url: json['url'] as String?,
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => VideoResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FastLaughRespToJson(FastLaughResp instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'url': instance.url,
      'videos': instance.videos,
    };
