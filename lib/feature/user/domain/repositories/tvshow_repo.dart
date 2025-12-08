import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';

abstract class TvshowRepo {
  Future<Either<MainFailure, List<Tvshow>>> geTvShows(TvshowCategory category);
}
