import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/strings.dart';

import 'package:netflix/domain/core/failures/main_failure.dart';

import 'package:netflix/domain/fast_laugh/models/fast_laugh_resp/fast_laugh_resp.dart';
import 'package:netflix/infrastructure/api_key.dart';

import '../../domain/fast_laugh/fast_laugh_service.dart';

@LazySingleton(as: FastLaughService)
class FastLaughImpl implements FastLaughService {
  @override
  Future<Either<MainFailure, FastLaughResp>> getPopularVideos() async {
    // Define the headers
    Map<String, dynamic> headers = {
      'Authorization': videoAPI,
    };
    // Create an instance of RequestOptions to include headers
    Options options = Options(
      headers: headers,
    );
    try {
      final Response response =
          await Dio(BaseOptions()).get(videoUrl, options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = FastLaughResp.fromJson(response.data);
        return Right(result);
      } else {
        log("error server");
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
