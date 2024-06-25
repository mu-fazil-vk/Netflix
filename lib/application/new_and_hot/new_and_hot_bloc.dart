import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/new_and_hot/model/coming_soon_resp/coming_soon_resp.dart';
import 'package:netflix/domain/new_and_hot/new_and_hot_service.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotService _newAndHotService;
  final IDownloadsRepo _iDownloadsRepo;
  NewAndHotBloc(this._newAndHotService, this._iDownloadsRepo)
      : super(NewAndHotState.initial()) {
    //ComingSoon
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui

      emit(state.copyWith(isLoading: true));

      //get coming soon movie data
      final _result = await _newAndHotService.getComingSoonMovieData();

      //data to state
      final _newState = _result.fold(
          (MainFailure failure) => state.copyWith(isLoading: false, isError: true),
          (ComingSoonResp list) => NewAndHotState(
              comingSoonMovieList: list.results,
              popularMoviesList: state.popularMoviesList,
              isLoading: false,
              isError: false));

      emit(_newState);
    });

    //EveryOnesWatching
    on<LoadDataInPopularMovies>((event, emit) async {
      //send loading to ui

      emit(const NewAndHotState(
          comingSoonMovieList: [],
          popularMoviesList: [],
          isLoading: true,
          isError: false));

      // get popular movie data
      final _result = await _iDownloadsRepo.getDownloadsImages();
      //data to state
      final _newState = _result.fold(
          (MainFailure failure) => state.copyWith(isLoading: false, isError: true), (List<Downloads> list) {
        return NewAndHotState(
            comingSoonMovieList: state.comingSoonMovieList,
            popularMoviesList: list,
            isLoading: false,
            isError: false);
      });

      emit(_newState);
    });
  }
}
