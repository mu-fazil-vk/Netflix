//this impliments to infrastructure
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/fast_laugh/models/fast_laugh_resp/fast_laugh_resp.dart';

import '../core/failures/main_failure.dart';

abstract class FastLaughService {
  Future<Either<MainFailure, FastLaughResp>> getPopularVideos();
}
