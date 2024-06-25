import 'package:json_annotation/json_annotation.dart';

part 'video_file.g.dart';

@JsonSerializable()
class VideoFile {
  int? id;
  String? quality;
  @JsonKey(name: 'file_type')
  String? fileType;
  int? width;
  int? height;
  String? link;

  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.link,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) {
    return _$VideoFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VideoFileToJson(this);
}
