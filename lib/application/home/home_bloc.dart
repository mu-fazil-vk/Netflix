import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/new_and_hot/model/coming_soon_resp/coming_soon_resp.dart';
import 'package:netflix/domain/new_and_hot/new_and_hot_service.dart';


part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewAndHotService _newAndHotService;
  HomeBloc(
    this._newAndHotService,
  ) : super(HomeState.initial()) {
    //get home screen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui
      emit(state.copyWith(
          isLoading: true,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString()));
      //get data
      final _comingSoonResult =
          await _newAndHotService.getComingSoonMovieData();
      //final _trendingResult = await _iDownloadsRepo.getDownloadsImages();

      //transform data

      // final _state1 = _comingSoonResult.fold(
      //     (MainFailure failure) =>
      //         state.copyWith(isError: true, isLoading: false, stateId: DateTime.now().millisecondsSinceEpoch.toString()), // else use uuid for stateId
      //     (ComingSoonResp resp) => state.copyWith(
      //         isLoading: false, isError: false, top10: [], stateId: DateTime.now().millisecondsSinceEpoch.toString()));
      // emit(_state1);

      final _state2 = _comingSoonResult.fold(
          (MainFailure failure) => state.copyWith(
              isError: true,
              isLoading: false,
              stateId: DateTime.now().millisecondsSinceEpoch.toString()),
          (ComingSoonResp resp) {
        final pym = resp.results;
        final tn = resp.results;
        final south = resp.results;
        final tDrama = resp.results;
        tn.shuffle();
        pym.shuffle();
        south.shuffle();
        tDrama.shuffle();
        return state.copyWith(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: false,
            pastYearMovies: pym,
            top10: resp.results,
            trendingNow: tn,
            southIndian: south,
            tenseDramas: tDrama);
      });

      //send to ui
      emit(_state2);
    });
  }
}
