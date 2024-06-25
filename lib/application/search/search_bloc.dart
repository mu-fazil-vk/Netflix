import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      //if already fetched the list then dont load again
      if (state.idleList.isNotEmpty) {
        emit(state);
        return; //its for stop executing remaining parts
      }
      //initialize with loading true
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      // get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });

    //reset search result for showing top movies on no value on search
    on<SearchMovieReset>(
      (event, emit) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
      },
    );

    //search result state
    on<SearchMovie>((event, emit) async {
      //initialize with loading true
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      // call search movie api
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResp r) {
        return SearchState(
            searchResultList: r.results,
            idleList: state.idleList,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });
  }
}
