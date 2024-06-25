part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String
        stateId, //for update each time, else it didn't update properly for new data
    required List<ComingSoonResult> pastYearMovies,
    required List<ComingSoonResult> trendingNow,
    required List<ComingSoonResult> top10,
    required List<ComingSoonResult> tenseDramas,
    required List<ComingSoonResult> southIndian,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      stateId: '0',
      pastYearMovies: [],
      trendingNow: [],
      top10: [],
      tenseDramas: [],
      southIndian: [],
      isLoading: false,
      isError: false);
}
