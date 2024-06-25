import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/new_and_hot/model/coming_soon_resp/coming_soon_resp.dart';

abstract class NewAndHotService {
  Future<Either<MainFailure, ComingSoonResp>> getComingSoonMovieData();
  //we use Downloads instead getting popular movie data
  //Future<Either<MainFailure, ComingSoonResp>> getPopularMovieData();
}
