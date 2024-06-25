// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoFile _$VideoFileFromJson(Map<String, dynamic> json) => VideoFile(
      id: (json['id'] as num?)?.toInt(),
      quality: json['quality'] as String?,
      fileType: json['file_type'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      link: json['link'] as String?,
    );

Map<String, dynamic> _$VideoFileToJson(VideoFile instance) => <String, dynamic>{
      'id': instance.id,
      'quality': instance.quality,
      'file_type': instance.fileType,
      'width': instance.width,
      'height': instance.height,
      'link': instance.link,
    };
