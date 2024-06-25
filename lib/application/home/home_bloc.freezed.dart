// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataImplCopyWith<$Res> {
  factory _$$GetHomeScreenDataImplCopyWith(_$GetHomeScreenDataImpl value,
          $Res Function(_$GetHomeScreenDataImpl) then) =
      __$$GetHomeScreenDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeScreenDataImpl>
    implements _$$GetHomeScreenDataImplCopyWith<$Res> {
  __$$GetHomeScreenDataImplCopyWithImpl(_$GetHomeScreenDataImpl _value,
      $Res Function(_$GetHomeScreenDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomeScreenDataImpl implements GetHomeScreenData {
  const _$GetHomeScreenDataImpl();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenDataImpl;
}

/// @nodoc
mixin _$HomeState {
  String get stateId =>
      throw _privateConstructorUsedError; //for update each time, else it didn't update properly for new data
  List<ComingSoonResult> get pastYearMovies =>
      throw _privateConstructorUsedError;
  List<ComingSoonResult> get trendingNow => throw _privateConstructorUsedError;
  List<ComingSoonResult> get top10 => throw _privateConstructorUsedError;
  List<ComingSoonResult> get tenseDramas => throw _privateConstructorUsedError;
  List<ComingSoonResult> get southIndian => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<ComingSoonResult> pastYearMovies,
      List<ComingSoonResult> trendingNow,
      List<ComingSoonResult> top10,
      List<ComingSoonResult> tenseDramas,
      List<ComingSoonResult> southIndian,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovies = null,
    Object? trendingNow = null,
    Object? top10 = null,
    Object? tenseDramas = null,
    Object? southIndian = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovies: null == pastYearMovies
          ? _value.pastYearMovies
          : pastYearMovies // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      trendingNow: null == trendingNow
          ? _value.trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      top10: null == top10
          ? _value.top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tenseDramas: null == tenseDramas
          ? _value.tenseDramas
          : tenseDramas // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      southIndian: null == southIndian
          ? _value.southIndian
          : southIndian // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<ComingSoonResult> pastYearMovies,
      List<ComingSoonResult> trendingNow,
      List<ComingSoonResult> top10,
      List<ComingSoonResult> tenseDramas,
      List<ComingSoonResult> southIndian,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovies = null,
    Object? trendingNow = null,
    Object? top10 = null,
    Object? tenseDramas = null,
    Object? southIndian = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$InitialImpl(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovies: null == pastYearMovies
          ? _value._pastYearMovies
          : pastYearMovies // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      trendingNow: null == trendingNow
          ? _value._trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      top10: null == top10
          ? _value._top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tenseDramas: null == tenseDramas
          ? _value._tenseDramas
          : tenseDramas // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      southIndian: null == southIndian
          ? _value._southIndian
          : southIndian // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.stateId,
      required final List<ComingSoonResult> pastYearMovies,
      required final List<ComingSoonResult> trendingNow,
      required final List<ComingSoonResult> top10,
      required final List<ComingSoonResult> tenseDramas,
      required final List<ComingSoonResult> southIndian,
      required this.isLoading,
      required this.isError})
      : _pastYearMovies = pastYearMovies,
        _trendingNow = trendingNow,
        _top10 = top10,
        _tenseDramas = tenseDramas,
        _southIndian = southIndian;

  @override
  final String stateId;
//for update each time, else it didn't update properly for new data
  final List<ComingSoonResult> _pastYearMovies;
//for update each time, else it didn't update properly for new data
  @override
  List<ComingSoonResult> get pastYearMovies {
    if (_pastYearMovies is EqualUnmodifiableListView) return _pastYearMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovies);
  }

  final List<ComingSoonResult> _trendingNow;
  @override
  List<ComingSoonResult> get trendingNow {
    if (_trendingNow is EqualUnmodifiableListView) return _trendingNow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNow);
  }

  final List<ComingSoonResult> _top10;
  @override
  List<ComingSoonResult> get top10 {
    if (_top10 is EqualUnmodifiableListView) return _top10;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top10);
  }

  final List<ComingSoonResult> _tenseDramas;
  @override
  List<ComingSoonResult> get tenseDramas {
    if (_tenseDramas is EqualUnmodifiableListView) return _tenseDramas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramas);
  }

  final List<ComingSoonResult> _southIndian;
  @override
  List<ComingSoonResult> get southIndian {
    if (_southIndian is EqualUnmodifiableListView) return _southIndian;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndian);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, pastYearMovies: $pastYearMovies, trendingNow: $trendingNow, top10: $top10, tenseDramas: $tenseDramas, southIndian: $southIndian, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovies, _pastYearMovies) &&
            const DeepCollectionEquality()
                .equals(other._trendingNow, _trendingNow) &&
            const DeepCollectionEquality().equals(other._top10, _top10) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramas, _tenseDramas) &&
            const DeepCollectionEquality()
                .equals(other._southIndian, _southIndian) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_pastYearMovies),
      const DeepCollectionEquality().hash(_trendingNow),
      const DeepCollectionEquality().hash(_top10),
      const DeepCollectionEquality().hash(_tenseDramas),
      const DeepCollectionEquality().hash(_southIndian),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<ComingSoonResult> pastYearMovies,
      required final List<ComingSoonResult> trendingNow,
      required final List<ComingSoonResult> top10,
      required final List<ComingSoonResult> tenseDramas,
      required final List<ComingSoonResult> southIndian,
      required final bool isLoading,
      required final bool isError}) = _$InitialImpl;

  @override
  String get stateId;
  @override //for update each time, else it didn't update properly for new data
  List<ComingSoonResult> get pastYearMovies;
  @override
  List<ComingSoonResult> get trendingNow;
  @override
  List<ComingSoonResult> get top10;
  @override
  List<ComingSoonResult> get tenseDramas;
  @override
  List<ComingSoonResult> get southIndian;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
