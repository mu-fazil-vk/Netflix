import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  //client error: network error, etc...
  const factory MainFailure.clientFailure() = _ClientFailure;
  //server error: api key related or base url related
  const factory MainFailure.serverFailure() = _ServerFailure;
}
