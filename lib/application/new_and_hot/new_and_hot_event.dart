part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotEvent with _$NewAndHotEvent {
  const factory NewAndHotEvent.loadDataInComingSoon() = LoadDataInComingSoon;
  const factory NewAndHotEvent.loadDataInPopularMovies() = LoadDataInPopularMovies;
}