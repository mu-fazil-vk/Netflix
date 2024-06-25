import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/fast_laugh/models/fast_laugh_resp/video.dart';

//inherited widget for accessing parent class data
class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget; //child widget
  final VideoResultData videoData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.videoData})
      : super(child: widget);
  @override
  //fn: if parent changed or updated, then want to rebuild?
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.videoData != videoData; //updation condition
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final String? thumpImage =
        VideoListItemInheritedWidget.of(context)?.videoData.image;
    final String? videoUrl =
        VideoListItemInheritedWidget.of(context)?.videoData.videoFiles[1].link;
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl!, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kBlackColor.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.volume_off,
                        color: kWhiteColor,
                        size: 30,
                      )),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: thumpImage == null
                            ? null
                            : NetworkImage(thumpImage),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder:
                          (BuildContext context, Set<int> newLikedListIds, _) {
                        final int? _videoId =
                            VideoListItemInheritedWidget.of(context)
                                ?.videoData
                                .id;

                        return GestureDetector(
                          onTap: () {
                            if (_videoId != null &&
                                !newLikedListIds.contains(_videoId)) {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(LikeVideo(id: _videoId));
                              likedVideosIdsNotifier.value.add(_videoId);
                              likedVideosIdsNotifier.notifyListeners();
                            } else if (_videoId != null &&
                                newLikedListIds.contains(_videoId)) {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _videoId));
                              likedVideosIdsNotifier.value.remove(_videoId);
                              likedVideosIdsNotifier.notifyListeners();
                            }
                            return;
                          },
                          child: VideoActionsWidget(
                            icon: CupertinoIcons.smiley_fill,
                            title: 'LOL',
                            color:
                                likedVideosIdsNotifier.value.contains(_videoId)
                                    ? kYellowColor
                                    : kWhiteColor,
                          ),
                        );
                      },
                    ),
                    VideoActionsWidget(
                      icon: CupertinoIcons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final videoTitle =
                            VideoListItemInheritedWidget.of(context)
                                ?.videoData
                                .user
                                ?.name;
                        Share.share(videoTitle ?? 'Title not found!');
                      },
                      child: VideoActionsWidget(
                        icon: CupertinoIcons.share,
                        title: 'Share',
                      ),
                    ),
                    VideoActionsWidget(
                      icon: CupertinoIcons.play_circle,
                      title: 'Play',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  VideoActionsWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.color = kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 35,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final void Function(bool isPlaying) onStateChanged;
  final String videoUrl;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      //height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? Center(
              child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController)),
            )
          : const Center(
              child: CupertinoActivityIndicator(
                color: kWhiteColor,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
