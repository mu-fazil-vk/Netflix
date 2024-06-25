// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/downloads/downloads_bloc.dart' as _i14;
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart' as _i11;
import 'package:netflix/application/home/home_bloc.dart' as _i15;
import 'package:netflix/application/new_and_hot/new_and_hot_bloc.dart' as _i13;
import 'package:netflix/application/search/search_bloc.dart' as _i12;
import 'package:netflix/domain/downloads/i_downloads_repo.dart' as _i3;
import 'package:netflix/domain/fast_laugh/fast_laugh_service.dart' as _i9;
import 'package:netflix/domain/new_and_hot/new_and_hot_service.dart' as _i5;
import 'package:netflix/domain/search/search_service.dart' as _i7;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:netflix/infrastructure/fast_laugh/fast_laugh_impl.dart' as _i10;
import 'package:netflix/infrastructure/new_and_hot/new_and_hot_impl.dart'
    as _i6;
import 'package:netflix/infrastructure/search/search_impliment.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadRepositiory());
    gh.lazySingleton<_i5.NewAndHotService>(() => _i6.NewAndHotImpl());
    gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImpl());
    gh.lazySingleton<_i9.FastLaughService>(() => _i10.FastLaughImpl());
    gh.factory<_i11.FastLaughBloc>(
        () => _i11.FastLaughBloc(gh<_i9.FastLaughService>()));
    gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
          gh<_i3.IDownloadsRepo>(),
          gh<_i7.SearchService>(),
        ));
    gh.factory<_i13.NewAndHotBloc>(() => _i13.NewAndHotBloc(
          gh<_i5.NewAndHotService>(),
          gh<_i3.IDownloadsRepo>(),
        ));
    gh.factory<_i14.DownloadsBloc>(
        () => _i14.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
    gh.factory<_i15.HomeBloc>(() => _i15.HomeBloc(gh<_i5.NewAndHotService>()));
    return this;
  }
}
