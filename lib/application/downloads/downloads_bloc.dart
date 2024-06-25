import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  //bcz of injection, it automatically calls child class DownloadsRepository instead of IDownloadsRepo
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadImages>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, downloadsFailureOrSuccessOption: none()));

      if (state.downloads.isNotEmpty) {
        emit(DownloadsState(
            isLoading: false,
            downloads: state.downloads,
            downloadsFailureOrSuccessOption:
                state.downloadsFailureOrSuccessOption));
        return;
      }

      //             //left      //right
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();

      emit(downloadsOption.fold(
          //left
          (failure) => state.copyWith(
              isLoading: true,
              downloadsFailureOrSuccessOption: Some(Left(failure))),
          //right
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureOrSuccessOption: Some(Right(success)))));
    });
  }
}
