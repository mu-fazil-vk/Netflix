// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadsImpl _$$DownloadsImplFromJson(Map<String, dynamic> json) =>
    _$DownloadsImpl(
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$$DownloadsImplToJson(_$DownloadsImpl instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'overview': instance.overview,
    };
