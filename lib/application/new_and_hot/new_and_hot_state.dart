part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required List<ComingSoonResult> comingSoonMovieList,
    required List<Downloads> popularMoviesList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory NewAndHotState.initial() => const NewAndHotState(comingSoonMovieList: [], popularMoviesList: [], isError: false, isLoading: false);
}
