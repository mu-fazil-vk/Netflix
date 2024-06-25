import 'package:json_annotation/json_annotation.dart';

import 'user.dart';
import 'video_file.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoResultData {
  int? id;
  int? width;
  int? height;
  String? url;
  String? image;
  int? duration;
  User? user;
  @JsonKey(name: 'video_files')
  List<VideoFile> videoFiles;

  VideoResultData({
    this.id,
    this.width,
    this.height,
    this.url,
    this.image,
    this.duration,
    this.user,
    this.videoFiles = const [],
  });

  factory VideoResultData.fromJson(Map<String, dynamic> json) =>
      _$VideoResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResultDataToJson(this);
}
