import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/fast_laugh/fast_laugh_service.dart';

import '../../domain/fast_laugh/models/fast_laugh_resp/video.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    FastLaughService _videoService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //loading
      emit(const FastLaughState(
          videosList: [], isLoading: true, isError: false));
      //get popular videos

      final _result = await _videoService.getPopularVideos();
      final _state = _result.fold(
          (l) =>
              FastLaughState(videosList: [], isLoading: false, isError: true),
          (r) => FastLaughState(
              videosList: r.videos, isLoading: false, isError: false));

      //send to ui
      emit(_state);
    });

    // on<LikeVideo>((event, emit) async {
    //   likedVideosIdsNotifier.value.add(event.id);
    //likedVideosIdsNotifier.notifyListeners();
    // });
    // on<UnlikeVideo>((event, emit) async {
    //   likedVideosIdsNotifier.value.remove(event.id);
    //likedVideosIdsNotifier.notifyListeners();
    // });
  }
}
