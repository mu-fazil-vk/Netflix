import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/new_and_hot/model/coming_soon_resp/coming_soon_resp.dart';
import 'package:netflix/domain/new_and_hot/new_and_hot_service.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: NewAndHotService)
class NewAndHotImpl implements NewAndHotService {
  @override
  Future<Either<MainFailure, ComingSoonResp>> getComingSoonMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.comingSoonMovies);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ComingSoonResp.fromJson(response.data);
        

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
